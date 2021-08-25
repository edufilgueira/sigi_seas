class AddMoreColumnsToSocioedukSolicitacaoVaga < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_solicitacao_vagas, :logradouro, :string
    add_column :socioeduk_solicitacao_vagas, :numero_logradouro, :string
    add_column :socioeduk_solicitacao_vagas, :complemento, :string
    add_column :socioeduk_solicitacao_vagas, :bairro, :string
    add_column :socioeduk_solicitacao_vagas, :cep, :string
    add_reference :socioeduk_solicitacao_vagas, :cidade, foreign_key: true
    add_column :socioeduk_solicitacao_vagas, :cidade_comarca, :integer
    add_column :socioeduk_solicitacao_vagas, :cidade_cumprimento_medida, :integer
  end
end
