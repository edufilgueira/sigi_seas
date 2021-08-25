class AddColumnToSolicitacaoVaga < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_solicitacao_vaga_infracoes, :pontuacao_reinteracao, :boolean
    add_column :socioeduk_solicitacao_vaga_infracoes, :pontuacao_quantidade_reinteracao, :integer
    remove_column :socioeduk_solicitacao_vagas, :pontuacao_reinteracao
  end
end
