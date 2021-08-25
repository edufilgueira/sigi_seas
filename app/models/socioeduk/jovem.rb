# frozen_string_literal: true

class Socioeduk::Jovem < ApplicationRecord
  audited
  acts_as_paranoid
  belongs_to :opcao_sexual, required: false
  belongs_to :situacao_adolescente, required: false
  belongs_to :uf_naturalidade, class_name: 'Estado', foreign_key: 'uf_naturalidade_id'
  belongs_to :cidade_naturalidade, class_name: 'Cidade', foreign_key: 'cidade_naturalidade_id'
  belongs_to :tipo_cabelo, class_name: 'Socioeduk::TipoCabelo', foreign_key: 'socioeduk_tipo_cabelo_id', required: false
  belongs_to :usuario, foreign_key: 'usuario_id', required: false
  belongs_to :socioeduk_doc_recepcoes, foreign_key: 'socioeduk_doc_recepcoes_id', required: false

  has_many :outros_nomes, class_name: 'Socioeduk::OutroNome', foreign_key: 'socioeduk_jovem_id', dependent: :destroy
  has_many :jovem_caracteristicas, class_name: 'Socioeduk::JovemCaracteristica', foreign_key: 'socioeduk_jovem_id', dependent: :destroy
  has_many :endereco_jovens, class_name: 'Socioeduk::EnderecoJovem', foreign_key: 'socioeduk_jovem_id', dependent: :destroy
  has_many :jovem_contatos, class_name: 'Socioeduk::JovemContato', foreign_key: 'socioeduk_jovem_id', dependent: :destroy
  has_many :jovem_recepcoes, class_name: 'Socioeduk::JovemRecepcao', foreign_key: 'socioeduk_jovem_id', dependent: :destroy
  has_many :socioeduk_processos, class_name: 'Socioeduk::Processo', through: :jovem_recepcoes, dependent: :destroy
  has_many :jovem_documentos, class_name: 'Socioeduk::JovemDocumento', foreign_key: 'socioeduk_jovem_id', dependent: :destroy

  accepts_nested_attributes_for :outros_nomes, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :jovem_caracteristicas, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :endereco_jovens, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :jovem_contatos, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :jovem_recepcoes, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :jovem_documentos, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :socioeduk_doc_recepcoes, reject_if: :all_blank, allow_destroy: true

  validates_presence_of :nome, :sexo

  enum gender: %i[male female others]
  has_attached_file :foto, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: '/assets/images/missing.png', path: ":rails_root/app/assets/images/arquivos/:class/:attachment/:id/:style_:basename.:extension", url: "/assets/images/arquivos/:class/:attachment/:id/:style_:basename.:extension"
  validates_attachment_content_type :foto, content_type: %r{\Aimage/.*\z}
  before_save :translate_columns

  def translate_columns
    self.nome = I18n.transliterate(nome)
  end

  def cumprindo_medida?
    admissoes.where(tipo_desligamento_id: nil).present?
  end

  def ultima_admissao
    admissoes.last
  end

  # @return [Array<Array>]
  def self.gender_attributes_for_select
    genderes.map do |gender, _|
      [I18n.t("activerecord.attributes.#{model_name.i18n_key}.genders.#{gender}"), gender]
    end
  end

  def tipos_estado_civil
    ['Solteiro(a)', 'Casado(a)', 'Divorciado(a)', 'Viúvo(a)']
  end

  def nome_concat_mae
    nome + ' - Mãe: (' + nome_mae + ')'
  end

  # Busca todos os jovens que não foram adminido na recepção em nenhuma unidade
  def self.sem_admissao
    Socioeduk::Jovem.select('nome, sjr.id')
                    .joins('LEFT JOIN socioeduk_jovem_recepcoes sjr ON sjr.socioeduk_jovem_id = socioeduk_jovens.id')
                    .where("sjr.status = true AND sjr.id NOT IN (
      SELECT sgv.socioeduk_jovem_recepcao_id FROM socioeduk_gestao_vagas sgv
      INNER JOIN socioeduk_jovem_recepcoes sjr ON sjr.id = sgv.socioeduk_jovem_recepcao_id
      WHERE sgv.status != 'Finalizado' AND sgv.ativo = true AND sjr.status = 'true')").to_a
  end

  # Busca todos os jovens que não foram adminido na recepção em nenhuma unidade
  def self.cadastrado_sem_recepcao_e_liberados
    Socioeduk::Jovem.select('nome, id')
                    .where('id NOT IN (SELECT socioeduk_jovem_id FROM socioeduk_jovem_recepcoes jre where jre.status = true) ').to_a
  end

  # LISTA TODOS OS JOVENS RECEPCIONADO. METODO FOI CRIADO PARA MOSTRAR OS JOVENS RECEPCIONADOS E SEM PROCESSOS
  # FILTRANDO ASSIM A LISTA DE JOVENS NA TELA DE CADASTRO DE PROCESSOS
  def self.admitido_na_unidade_recepcao
    Socioeduk::Jovem.select('nome, sjr.id')
                    .joins('INNER JOIN socioeduk_jovem_recepcoes sjr ON sjr.socioeduk_jovem_id = socioeduk_jovens.id
                            INNER JOIN socioeduk_gestao_vagas sgv ON sgv.socioeduk_jovem_recepcao_id = sjr.id')
                    .where("sgv.status = 'Recepcionado' AND sgv.ativo = true")
                    .order("nome").to_a
  end
  # Busca todos os jovens que já foram adminido (jovem_recepcoes) e estão COM processo
  def self.admitido_na_unidade_recepcao_com_processo
    Socioeduk::Jovem.select('nome, jr.id')
                    .joins('INNER JOIN socioeduk_jovem_recepcoes jr ON jr.socioeduk_jovem_id = socioeduk_jovens.id
                            INNER JOIN socioeduk_processos p ON p.socioeduk_jovem_recepcao_id = jr.id
                            INNER JOIN socioeduk_medida_socioeducativas ms on p.id = ms.socioeduk_processo_id
                            INNER JOIN socioeduk_gestao_vagas gv ON gv.socioeduk_jovem_recepcao_id = jr.id')
                    .where("gv.status = 'Recepcionado' AND gv.ativo = true AND socioeduk_jovens.deleted_at is null AND jr.deleted_at is null AND p.deleted_at is null AND ms.deleted_at is null")
                    .order("nome").to_a
  end

  # Busca todos os jovens que já foram adminido (jovem_recepcoes) e estão SEM processo
  def self.jovens_recepcao_admitidos_sem_processo
    Socioeduk::Jovem.select('jre.id, nome, socioeduk_jovens.id jovem_id')
                    .joins('INNER JOIN socioeduk_jovem_recepcoes jre ON jre.socioeduk_jovem_id = socioeduk_jovens.id')
                    .where("jre.deleted_at IS NULL AND NOT EXISTS(select null from socioeduk_processos pro where pro.socioeduk_jovem_recepcao_id = jre.id)
                            AND jre.status = true")
                    .order("nome").to_a
  end

  # Busca todos os jovens que já foram adminido (jovem_recepcoes), estão sem processo e vaga negada no processo
  def self.jovens_recepcao_admitidos_sem_processo_vaga_negada
    Socioeduk::Jovem.select('jre.id, nome, socioeduk_jovens.id jovem_id')
                    .joins('INNER JOIN socioeduk_jovem_recepcoes jre ON jre.socioeduk_jovem_id = socioeduk_jovens.id')
                    .joins('INNER JOIN socioeduk_processos p ON p.socioeduk_jovem_recepcao_id = jre.id')
                    .where("jre.deleted_at IS NULL AND p.deleted_at IS NULL AND p.socioeduk_status_processo_id = 1 AND p.aguardando_vaga = true").to_a
  end

  # Busca todos os jovens que já foram adminido (jovem_recepcoes) e estão sem processo e não foram finalizados
  def self.jovens_recepcao_admitidos_sem_processo_e_nao_finalizado
    Socioeduk::Jovem.select('jre.id, nome, socioeduk_jovens.id jovem_id')
                    .joins('INNER JOIN socioeduk_jovem_recepcoes jre ON jre.socioeduk_jovem_id = socioeduk_jovens.id')
                    .where("jre.deleted_at IS NULL AND jre.status = true AND NOT EXISTS(select null from socioeduk_processos pro where pro.socioeduk_jovem_recepcao_id = jre.id)
            AND jre.status = true").to_a
  end

  # Busca todos os jovens que já foram adminido (jovem_recepcoes) e estão sem processo
  def self.todos_jovens_recepcao_admitidos
    Socioeduk::Jovem.select('jre.id, nome')
                    .joins('INNER JOIN socioeduk_jovem_recepcoes jre ON jre.socioeduk_jovem_id = socioeduk_jovens.id').to_a
  end

  def self.jovem_do_processo(id)
    Socioeduk::Jovem.select('jre.id, nome')
                    .joins('INNER JOIN socioeduk_jovem_recepcoes jre ON jre.socioeduk_jovem_id = socioeduk_jovens.id')
                    .where('jre.id = ?', id).to_a
  end

  # Lista apenas o jovem que foi adminido no processo editado
  def self.jovens_recepcao_admitidos_no_processo(jovem_recepcao_id)
    Socioeduk::Jovem.select('jre.id, nome')
                    .joins('INNER JOIN socioeduk_jovem_recepcoes jre ON jre.socioeduk_jovem_id = socioeduk_jovens.id')
                    .where('jre.id = ?', jovem_recepcao_id).to_a
  end

  # Busca todos os jovens que já foram adminido (jovem_recepcoes)
  def self.jovens_recepcao_admitidos
    Socioeduk::Jovem.select('jre.id, nome')
                    .joins('INNER JOIN socioeduk_jovem_recepcoes jre ON jre.socioeduk_jovem_id = socioeduk_jovens.id')
                    .where('jre.status = true').to_a
  end

  # listar jovens admitidos em uma unidade
  def self.listar_jovens_por_unidade(id_unidade)
    @jovens = Socioeduk::Jovem.select('sjr.socioeduk_jovem_id as jovem_id, sjr.id as jovem_recepcao_id, nome')
                              .joins('INNER JOIN socioeduk_jovem_recepcoes sjr ON sjr.socioeduk_jovem_id = socioeduk_jovens.id
                                      INNER JOIN socioeduk_gestao_vagas sgv on sgv.socioeduk_jovem_recepcao_id = sjr.id')
                              .where("sjr.status = true AND sgv.status != 'Finalizado' AND ativo = true AND para_unidade_socioeducativa_id = ?", id_unidade)
                              .order('nome')
  end

  def self.saude_jovem_nao_cadastrada
    Socioeduk::Jovem.select('jre.id, nome')
                    .joins('INNER JOIN socioeduk_jovem_recepcoes jre ON jre.socioeduk_jovem_id = socioeduk_jovens.id')
                    .where('jre.status = true AND not exists (select null from socioeduk_saude_jovens sj where sj.socioeduk_jovem_recepcao_id=jre.id)').to_a
  end
  # def self.saude_jovem_nao_cadastrada
  #   Socioeduk::Jovem.select('jre.id, nome')
  #       .joins('INNER JOIN socioeduk_jovem_recepcoes jre ON jre.socioeduk_jovem_id = socioeduk_jovens.id
  #               INNER JOIN socioeduk_gestao_vagas gv ON gv.socioeduk_jovem_recepcao_id = jre.id
  #               INNER JOIN unidades_socioeducativas us ON us.id = gv.para_unidade_socioeducativa_id')
  #       .where('jre.status = true AND gv.ativo = true AND recepcao = true AND not exists (select null from socioeduk_saude_jovens sj where sj.socioeduk_jovem_recepcao_id=jre.id)').to_a
  # end

  def self.saude_jovem_cumprindo_medida
    Socioeduk::Jovem.select('jre.id, nome')
                    .joins('INNER JOIN socioeduk_jovem_recepcoes jre ON jre.socioeduk_jovem_id = socioeduk_jovens.id')
                    .where('jre.status = true').to_a
  end

  def self.idade(data_nascimento)
    unless data_nascimento.nil?
      idade = ((Date.today - data_nascimento.to_date) / 365.24).to_i
      idade.to_s + ' anos'
    end
  end

  def self.to_csv
    raise inspect
    attributes = %w[id nome apelido nome_mae sexo]
    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |jovem|
        # csv << jovem.attributes.values_at(*attributes)
        csv << attributes.map { |attr| jovem.send(attr) }
      end
    end
  end
end
