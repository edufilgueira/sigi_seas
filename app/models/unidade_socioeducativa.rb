# frozen_string_literal: true

class UnidadeSocioeducativa < ApplicationRecord
  audited
  acts_as_paranoid
  validates_presence_of :nome, :sigla, :endereco
  default_scope { order(:sigla, :nome) }

  has_many :unidade_socioeducativa_blocos, :dependent => :destroy
  
  has_many :socioeduk_relatorio_diarios, class_name: 'Socioeduk::RelatorioDiario', foreign_key: :unidade_socioeducativa_id

  belongs_to :cidade

  accepts_nested_attributes_for :unidade_socioeducativa_blocos, reject_if: :all_blank, allow_destroy: true

  scope :unidade_recepcao, -> { find_by_recepcao(true)}
  scope :centros_socioeducativos, -> {where.not(sigla: ['URLBM', 'CRV', 'SEAS'])} # Não retorna na consulta URLBM, CRV e SEAS.
  scope :centros_socioeducativos_urlbm, -> {where.not(sigla: ['CRV', 'SEAS'])} # Não retorna na consulta CRV e SEAS.
  scope :centros_socioeducativos_capital, -> {where(cidade_id: 678)} # Centros Socioeducativos da capital.
  scope :centros_socioeducativos_interior, -> {where.not(cidade_id: 678)} # Centros Socioeducativos do interior.

  @var_capacidade_vagas_base = nil
  @var_capacidade_vagas_variada = nil

  def nome_sigla
    sigla + ' - ' + nome
  end
  # Busca a quantidade de blocos da unidade
  def quantidade_blocos
    UnidadeSocioeducativaBloco.select('id').where("unidade_socioeducativa_id = ?", self.id).count
  end

  # Busca a quantidade de vagas base da unidade
  def capacidade_vagas_base
    if (@var_capacidade_vagas_base.nil?)
      @var_capacidade_vagas_base = UnidadeSocioeducativa.joins("INNER JOIN unidade_socioeducativa_blocos usb ON usb.unidade_socioeducativa_id = unidades_socioeducativas.id
                                INNER JOIN unidade_bloco_dormitorios ubd ON ubd.unidade_socioeducativa_bloco_id = usb.id")
                                .where("unidades_socioeducativas.id = ? and usb.deleted_at is null and ubd.deleted_at is null", self.id).sum("capacidade_base") 
    end
    @var_capacidade_vagas_base
  end

  def capacidade_vagas_base_19_percentual
    return capacidade_vagas_base + (capacidade_vagas_base * 0.19)
  end
  

  # Busca a quantidade de cacidades de dormitório variadas da unidade
  def capacidade_vagas_variada
    if (@var_capacidade_vagas_variada.nil?)
      
      @var_capacidade_vagas_variada = UnidadeSocioeducativaBloco.joins("INNER JOIN unidade_bloco_dormitorios ubd ON ubd.unidade_socioeducativa_bloco_id = unidade_socioeducativa_blocos.id
                                      INNER JOIN unidade_bloco_dormitorio_capacidades ubdc ON ubdc.unidade_bloco_dormitorio_id = ubd.id")
                                      .where("ubd.deleted_at is null and ubd.deleted_at is null and unidade_socioeducativa_blocos.unidade_socioeducativa_id = ?", self.id).sum('quantidade_alteracao')
    end
    @var_capacidade_vagas_variada
  end

  def capacidade_total
    capacidade_vagas_base + capacidade_vagas_variada
  end

  def quantidade_jovem_admitido
    if self.recepcao != true
      cont = Socioeduk::Processo.select("j.id")
      .joins("inner join socioeduk_status_processos as sp on sp.id = socioeduk_processos.socioeduk_status_processo_id
              inner join socioeduk_medida_socioeducativas as ms on ms.socioeduk_processo_id = socioeduk_processos.id
              inner join socioeduk_tipo_medida_socioeducativas as tms on tms.id = ms.socioeduk_tipo_medida_socioeducativa_id
              inner join socioeduk_jovem_recepcoes as jr on jr.id = socioeduk_processos.socioeduk_jovem_recepcao_id
              inner join socioeduk_jovens as j on j.id = jr.socioeduk_jovem_id
              inner join socioeduk_gestao_vagas as gv on gv.socioeduk_jovem_recepcao_id = jr.id")
      .where("ms.socioeduk_situacao_cumprimento_id not in (3,5,6) and jr.status = true and gv.ativo = true 
              and j.deleted_at is null and jr.deleted_at is null and socioeduk_processos.deleted_at is null AND ms.deleted_at is null 
              AND para_unidade_socioeducativa_id = ?", self.id).count
      else
        cont = Socioeduk::GestaoVaga.ativos_recepcao
        cont = cont.length
      end
  end

  def disponibilidade_vagas
    capacidade_total - quantidade_jovem_admitido
  end

  def self.resumo_capacidades(params)
    query = "usb.deleted_at is null and ubd.deleted_at is null"
    if params[:regiao]
      query += " and c.id in (#{params[:regiao].values.join(', ')})"
    end
    if params[:sexo]
      query += " and unidades_socioeducativas.sexo in ('FM', '#{params[:sexo].values.join(', ')}')"
    end
    if params[:medida]
      query += " and tms.id in (#{params[:medida].values.join(', ')})"
    end
    if !params[:unidade_socioeducativa_id].blank?
      query += " and unidades_socioeducativas.id = #{params[:unidade_socioeducativa_id]}"
    end

    capacidades = UnidadeSocioeducativa.select("unidades_socioeducativas.id id_unidade, unidades_socioeducativas.sigla sigla_unidade, unidades_socioeducativas.nome unidade, unidades_socioeducativas.sexo sexo, tms.id id_tipo_medida, tms.descricao tipo_medida, c.id id_cidade, c.nome cidade, sum(ubd.capacidade_base) capacidade_base, round(sum(ubd.capacidade_base + (ubd.capacidade_base * 0.19))) capacidade_19_percent, round(sum(ubd.capacidade_base * 0.19)) acrescimo_19_percent")
    .joins("inner join unidade_socioeducativa_blocos usb on usb.unidade_socioeducativa_id = unidades_socioeducativas.id
      inner join unidade_bloco_dormitorios ubd on ubd.unidade_socioeducativa_bloco_id = usb.id
      inner join socioeduk_tipo_medida_socioeducativas tms on tms.id = usb.socioeduk_tipo_medida_socioeducativa_id
      inner join cidades c on c.id = unidades_socioeducativas.cidade_id")
    .where(query)
    .group("unidades_socioeducativas.id, unidades_socioeducativas.sigla, unidades_socioeducativas.nome, unidades_socioeducativas.sexo, tms.id, tms.descricao, c.id, c.nome")
    .order("unidades_socioeducativas.sigla, unidades_socioeducativas.nome, tms.descricao, c.nome")
  end

  def sigla_nome
    "#{sigla} - #{nome}"
  end

  def to_s
    sigla_nome
  end

  def quantidade_jovens_unidade
    Socioeduk::Jovem.select('sjr.socioeduk_jovem_id as jovem_id, sjr.id as jovem_recepcao_id, nome')
                    .joins('INNER JOIN socioeduk_jovem_recepcoes sjr ON sjr.socioeduk_jovem_id = socioeduk_jovens.id
                            INNER JOIN socioeduk_gestao_vagas sgv on sgv.socioeduk_jovem_recepcao_id = sjr.id')
                    .where("sjr.status = true AND ativo = true AND para_unidade_socioeducativa_id = ?", self.id)
                    .count('nome')
  end

  def self.resumo_capacidades_unidades
    UnidadeSocioeducativa.select("unidades_socioeducativas.sigla sigla_unidade, unidades_socioeducativas.nome unidade, tms.descricao tipo_medida, c.nome cidade, sum(ubd.capacidade_base) capacidade_base, round(sum(ubd.capacidade_base + (ubd.capacidade_base * 0.19))) capacidade_19_percent, round(sum(ubd.capacidade_base * 0.19)) acrescimo_19_percent, case when unidades_socioeducativas.sigla = 'CEABM' then 'Feminino' else 'Masculino' end sexo")
    .joins("inner join unidade_socioeducativa_blocos usb on usb.unidade_socioeducativa_id = unidades_socioeducativas.id
            inner join unidade_bloco_dormitorios ubd on ubd.unidade_socioeducativa_bloco_id = usb.id
            inner join socioeduk_tipo_medida_socioeducativas tms on tms.id = usb.socioeduk_tipo_medida_socioeducativa_id
            inner join cidades c on c.id = cidade_id")
    .group("unidades_socioeducativas.sigla, unidades_socioeducativas.nome, tms.descricao, c.nome")
    .order("unidades_socioeducativas.sigla, unidades_socioeducativas.nome, tms.descricao, c.nome")
  end
  
  
end
