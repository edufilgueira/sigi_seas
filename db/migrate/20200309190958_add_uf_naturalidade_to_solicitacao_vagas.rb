class AddUfNaturalidadeToSolicitacaoVagas < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_solicitacao_vagas, :cidade_naturalidade_id, :integer
  end
end
