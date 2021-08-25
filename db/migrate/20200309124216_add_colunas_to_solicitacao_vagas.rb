class AddColunasToSolicitacaoVagas < ActiveRecord::Migration[5.1]
  def change
    add_reference :socioeduk_solicitacao_vagas, :estado, foreign_key: true
    add_reference :socioeduk_solicitacao_vagas, :socioeduk_opcao_sexual, foreign_key: true
    add_column :socioeduk_solicitacao_vagas, :nome_pai, :string
  end
end
