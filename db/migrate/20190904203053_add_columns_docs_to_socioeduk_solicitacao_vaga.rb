class AddColumnsDocsToSocioedukSolicitacaoVaga < ActiveRecord::Migration[5.1]
  def change
    add_attachment :socioeduk_solicitacao_vagas, :doc_guia_cnj
    add_attachment :socioeduk_solicitacao_vagas, :doc_pessoais
    add_attachment :socioeduk_solicitacao_vagas, :doc_pedido_internacao_provisoria
    add_attachment :socioeduk_solicitacao_vagas, :doc_certidao_antecedentes
    add_attachment :socioeduk_solicitacao_vagas, :doc_decisao_interlocutoria
    add_attachment :socioeduk_solicitacao_vagas, :doc_estudos_tecnicos
    add_attachment :socioeduk_solicitacao_vagas, :doc_oficio_crv
    add_attachment :socioeduk_solicitacao_vagas, :doc_historico_escolar
    add_attachment :socioeduk_solicitacao_vagas, :doc_historico_saude
    add_attachment :socioeduk_solicitacao_vagas, :doc_comprovante_envio_malote_digital
  end
end