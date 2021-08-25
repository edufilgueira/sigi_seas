class Socioeduk::SolicitacaoVaga < ApplicationRecord

  audited
  acts_as_paranoid
  enum tipos_documentos: [:guia_cnj, :documento_pessoal, :representacao_pedido_internacao_provisoria, :certidao_antecedentes, :decisao_interlocutoria_ou_sentenca, :estudos_tecnicos, :historico_escolar, :historico_saude, :comprovante_envio_malote_digital]
  
  belongs_to :tipo_medida_socioeducativa, class_name: 'Socioeduk::TipoMedidaSocioeducativa', foreign_key: "socioeduk_tipo_medida_socioeducativa_id"
  belongs_to :estado, class_name: "Estado", foreign_key: "estado_id"
  belongs_to :opcao_sexual, required: false
  belongs_to :usuario_resposta, class_name: "Usuario", foreign_key: "respondido_por", required: false
  belongs_to :usuario

  has_many :socioeduk_solicitacao_vaga_infracoes, class_name: 'Socioeduk::SolicitacaoVagaInfracao'

  accepts_nested_attributes_for :socioeduk_solicitacao_vaga_infracoes, reject_if: :all_blank, allow_destroy: true

  has_attached_file :doc_guia_cnj
  has_attached_file :doc_pessoais
  has_attached_file :doc_pedido_internacao_provisoria
  has_attached_file :doc_certidao_antecedentes
  has_attached_file :doc_decisao_interlocutoria
  has_attached_file :doc_estudos_tecnicos
  # has_attached_file :doc_oficio_crv
  has_attached_file :doc_historico_escolar
  has_attached_file :doc_historico_saude
  has_attached_file :doc_comprovante_envio_malote_digital
  has_attached_file :doc_unico
  has_attached_file :resposta_arquivo_processo
  has_attached_file :resposta_arquivo_processo2
  has_attached_file :resposta_arquivo_processo3
  has_attached_file :resposta_arquivo_processo4

  validates_attachment_content_type :doc_guia_cnj, content_type: "application/pdf"
  validates_attachment_content_type :doc_pessoais, content_type: "application/pdf"
  validates_attachment_content_type :doc_pedido_internacao_provisoria, content_type: "application/pdf"
  validates_attachment_content_type :doc_certidao_antecedentes, content_type: "application/pdf"
  validates_attachment_content_type :doc_decisao_interlocutoria, content_type: "application/pdf"
  validates_attachment_content_type :doc_estudos_tecnicos, content_type: "application/pdf"
  # validates_attachment_content_type :doc_oficio_crv, content_type: "application/pdf"
  validates_attachment_content_type :doc_historico_escolar, content_type: "application/pdf"
  validates_attachment_content_type :doc_historico_saude, content_type: "application/pdf"
  validates_attachment_content_type :doc_comprovante_envio_malote_digital, content_type: "application/pdf"
  validates_attachment_content_type :doc_unico, content_type: "application/pdf"
  validates_attachment_content_type :resposta_arquivo_processo, content_type: "application/pdf"
  validates_attachment_content_type :resposta_arquivo_processo2, content_type: "application/pdf"
  validates_attachment_content_type :resposta_arquivo_processo3, content_type: "application/pdf"
  validates_attachment_content_type :resposta_arquivo_processo4, content_type: "application/pdf"

  validates_presence_of :nome, :data_nascimento, :socioeduk_tipo_medida_socioeducativa_id, :sexo, :cidade_id, :logradouro, :bairro, :cidade_comarca, :estado_id, :cidade_naturalidade_id
  # validates_presence_of :doc_guia_cnj, :doc_pessoais, :doc_pedido_internacao_provisoria, :doc_certidao_antecedentes, :doc_decisao_interlocutoria, :doc_comprovante_envio_malote_digital, :doc_unico

  # TIPO_DOC_UNICO: {doc_guia_cnj: 0, doc_pessoais: 1, doc_pedido_internacao_provisoria: 2, doc_certidao_antecedentes: 3, doc_decisao_interlocutoria: 4, :doc_estudos_tecnicos, :doc_historico_escolar, :doc_historico_saude, :doc_comprovante_envio_malote_digital, :doc_unico}
  def pontuacao
    solicitacao_vagas = Socioeduk::SolicitacaoVagaInfracao
                        .joins(:artigo_infracao)
                        .select('pontuacao_reinteracao','pontuacao_quantidade_reinteracao','tipo_natureza','pontuacao_continuado','estupro_vulneravel','socioeduk_artigo_infracoes.*')
                        .where("solicitacao_vaga_id = ?", self.id)
    calc = 0
    
    # Constante
    c = 0.05; # Ponderação Certidão Positiva (5%)
    a = 10; # Ponderação Apreendido
    o = 10; # Organização Criminosa

    # Variaveis
    calc_descumprimento_medida = 0;
    calc_continuado = 0;
    calc_vulneravel = 0;
    calc_reiteracao = 0;

    solicitacao_vagas.each do |solicitacao_vaga|
      case solicitacao_vaga.tipo_natureza
        when 'Consumada'
          calc += solicitacao_vaga.ponderacao
        when 'Tentada'
          calc += solicitacao_vaga.ponderacao - (solicitacao_vaga.ponderacao * 0.3)
      end

      if (self.pontuacao_descumprimento_medida)
        calc_descumprimento_medida = solicitacao_vaga.ponderacao * 0.1
      end

      if (solicitacao_vaga.pontuacao_continuado)
        calc_continuado = solicitacao_vaga.ponderacao * 0.3
      end

      if (solicitacao_vaga.estupro_vulneravel)
        calc_vulneravel = solicitacao_vaga.ponderacao * 0.5
      end
      
      if (solicitacao_vaga.pontuacao_reinteracao)
        calc_reiteracao = solicitacao_vaga.ponderacao * 0.1 * solicitacao_vaga.pontuacao_quantidade_reinteracao
      end

    end
    
    # Certidão Positiva
    certidao_positiva = 0
    if (self.pontuacao_certidao_positiva)
      if self.pontuacao_quantidade_certidao_positiva.nil?
        self.pontuacao_quantidade_certidao_positiva = 10
      end

      if self.pontuacao_quantidade_certidao_positiva > 0
        total = 0
        quantidade = self.pontuacao_quantidade_certidao_positiva
        (1..self.pontuacao_quantidade_certidao_positiva).each{ |i|
          total += calc * c;
        }
        certidao_positiva = total
      end
    end

    # Apreendido
    if (self.pontuacao_apreendido)
      calc += a
    end

    # Apreendido
    if (self.pontuacao_organizacao_criminosa)
      calc += o
    end

    # Retorno
    calc += calc_descumprimento_medida + calc_continuado + calc_reiteracao + certidao_positiva
    calc -= calc_vulneravel
    calc.round(2)
  end

end
