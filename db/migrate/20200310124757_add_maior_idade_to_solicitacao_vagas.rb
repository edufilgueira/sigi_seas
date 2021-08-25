class AddMaiorIdadeToSolicitacaoVagas < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_solicitacao_vagas, :maior_idade, :date
  end
end
