class AddDocUnicoToSocioedukSolicitacaoVagas < ActiveRecord::Migration[5.1]
  def change
    add_attachment :socioeduk_solicitacao_vagas, :doc_unico
  end
end
