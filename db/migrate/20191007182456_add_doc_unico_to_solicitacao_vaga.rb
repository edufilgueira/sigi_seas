class AddDocUnicoToSolicitacaoVaga < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_solicitacao_vagas, :doc_unico_array, :text, array: true, default: []
  end
end