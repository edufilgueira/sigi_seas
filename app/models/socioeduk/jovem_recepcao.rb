# frozen_string_literal: true

class Socioeduk::JovemRecepcao < ApplicationRecord
  audited
  acts_as_paranoid

  belongs_to :usuario, required: false
  belongs_to :socioeduk_jovem, class_name: 'Socioeduk::Jovem', required: false
  belongs_to :socioeduk_tipo_medida_socioeducativa, class_name: 'Socioeduk::TipoMedidaSocioeducativa', required: false
  belongs_to :socioeduk_doc_recepcoes, class_name: 'Socioeduk::DocRecepcoes', required: false

  has_many :socioeduk_gestao_vagas, class_name: 'Socioeduk::GestaoVaga', foreign_key: 'socioeduk_jovem_recepcao_id'
  has_many :socioeduk_processos, class_name: 'Socioeduk::Processo', foreign_key: 'socioeduk_jovem_recepcao_id'

  validates_presence_of :socioeduk_jovem_id, :datahora_apresentacao
  # validates :datahora_apresentacao, date: { before_or_equal_to: Proc.new { Time.now }, message: 'Data não pode ser superior a data atual.' }

  def self.listar_jovens_na_recepcao
    @lista_jovem_recepcoes = Socioeduk::JovemRecepcao
    .select('socioeduk_jovens.id', 'socioeduk_jovens.nome')
    .joins(:socioeduk_jovem, :socioeduk_gestao_vagas)
    .joins('left join socioeduk_tipo_medida_socioeducativas tms ON tms.id = socioeduk_jovem_recepcoes.socioeduk_tipo_medida_socioeducativa_id')
    .where('socioeduk_gestao_vagas.ativo = ? and socioeduk_gestao_vagas.status = ?', true, 'Recepcionado')
    .group('socioeduk_jovens.id', 'socioeduk_jovens.nome, socioeduk_jovem_recepcoes.status, socioeduk_jovem_recepcoes.datahora_apresentacao, tms.descricao').order('nome')
  end

  def self.ativar_recepcao_atual(recepcoes)
    recepcoes_anteriores = []
    recepcoes.each { |_k, v| recepcoes_anteriores.push(v[:id]) }
    recepcoes_anteriores.delete('')
    Socioeduk::JovemRecepcao.where(id: recepcoes_anteriores, status: true).update_all(status: false)
  end

  def self.listar_recepcoes_por_jovem(jovem_id)
    jovem_recepcoes = Socioeduk::JovemRecepcao.select("socioeduk_jovem_recepcoes.id, socioeduk_jovem_recepcoes.datahora_apresentacao data_recepcao, 
    socioeduk_jovem_recepcoes.recepcao_origem tipo_recepcao, 
    (
      select concat(uso.sigla, ' - ', uso.nome) as nome from socioeduk_gestao_vagas sgv
      left join unidades_socioeducativas uso ON uso.id = sgv.para_unidade_socioeducativa_id
      where sgv.socioeduk_jovem_recepcao_id = socioeduk_jovem_recepcoes.id and sgv.deleted_at is null
      order by sgv.id desc limit 1
    ) unidade,
    (
      select concat(uso.sigla, ' - ', uso.nome) as nome1 from socioeduk_gestao_vagas sgv
      left join unidades_socioeducativas uso ON uso.id = sgv.de_unidade_socioeducativa_id
      where sgv.socioeduk_jovem_recepcao_id = socioeduk_jovem_recepcoes.id and sgv.deleted_at is null
      order by sgv.id desc limit 1
    ) unidade_origem,
    (
      select sms.inicio from socioeduk_medida_socioeducativas sms
      where sms.socioeduk_processo_id = spr.id order by sms.id desc limit 1
    ) inicio,
    (
      select sms.data_conclusao from socioeduk_medida_socioeducativas sms
      where sms.socioeduk_processo_id = spr.id order by sms.id desc limit 1
    ) data_conclusao,
    (
      select tms.descricao from socioeduk_medida_socioeducativas sms
      left join socioeduk_tipo_medida_socioeducativas tms ON tms.id = sms.socioeduk_tipo_medida_socioeducativa_id
      where sms.socioeduk_processo_id = spr.id order by sms.id desc limit 1
    ) medida_socioeducativa,
    spr.id processo_id, ssp.descricao status_processo, socioeduk_jovem_recepcoes.status, socioeduk_jovem_recepcoes.data_saida, tms.descricao tms_descricao, tms.tipo_medida")
    .joins('left join socioeduk_tipo_medida_socioeducativas tms ON tms.id = socioeduk_jovem_recepcoes.socioeduk_tipo_medida_socioeducativa_id')
    .joins('left join socioeduk_processos spr ON spr.socioeduk_jovem_recepcao_id = socioeduk_jovem_recepcoes.id')
    .joins('left join socioeduk_status_processos ssp ON ssp.id = spr.socioeduk_status_processo_id')
    .where('spr.deleted_at is null and socioeduk_jovem_recepcoes.socioeduk_jovem_id = ?', jovem_id)
    .order('socioeduk_jovem_recepcoes.id desc')

    @lista = []
    jovem_recepcoes.each do |jovem_recepcao|
      hash = {}
      hash[:id] = jovem_recepcao.id
      hash[:data_recepcao] = jovem_recepcao&.data_recepcao.strftime('%d/%m/%Y')
      hash[:unidade] = jovem_recepcao.unidade
      hash[:unidade_origem] = jovem_recepcao.unidade_origem
      hash[:data_saida] = jovem_recepcao.data_saida
      hash[:tms_descricao] = jovem_recepcao.tms_descricao
      hash[:tipo_medida] = jovem_recepcao.tipo_medida
      hash[:inicio] = jovem_recepcao.inicio
      hash[:medida_socioeducativa] = jovem_recepcao.medida_socioeducativa
      hash[:processo_id] = jovem_recepcao.processo_id
      hash[:status_processo] = jovem_recepcao.status_processo
      hash[:status] = jovem_recepcao.status
      if(jovem_recepcao.status)
        if !jovem_recepcao&.inicio.nil?
          hash[:tempo] =  data_por_extenso(Date.parse(Time.now.strftime('%d/%m/%Y')), Date.parse(jovem_recepcao&.inicio.strftime('%d/%m/%Y'))) 
        else
          hash[:tempo] = "-"
        end
      else
        if !jovem_recepcao&.data_conclusao.nil? && !jovem_recepcao&.inicio.nil?
          hash[:tempo] =  data_por_extenso(Date.parse(jovem_recepcao&.data_conclusao.strftime('%d/%m/%Y')), Date.parse(jovem_recepcao&.inicio.strftime('%d/%m/%Y'))) 
        else
          hash[:tempo] = "-"
        end
      end
      @lista.push(hash)
    end
    @lista
  end

  def self.data_por_extenso(final, inicial)
    dias_bruto = (final - inicial).to_f
    meses = (dias_bruto/30).to_i
    dias = (dias_bruto - (meses * 30)).to_i
    meses > 1 ? text_mes = "meses": text_mes = "mês"
    dias > 1 ? text_dia = "dias": text_dia = "dia"
    text = meses.to_s + " " + text_mes + " e " + dias.to_s + " " + text_dia
    text
  end

end
