class AddDocumentoAlteradoToSocioedukSolicitacaoVagas < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_solicitacao_vagas, :documento_alterado, :boolean
  end
end
