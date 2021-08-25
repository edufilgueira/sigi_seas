class RemoveColumnSituacaoCriseToRelatorioDiarios < ActiveRecord::Migration[5.1]
  def change
    remove_column :socioeduk_relatorio_diarios, :situacao_crise, :string
    add_column :socioeduk_relatorio_diarios, :situacao_crise_simples, :integer
    add_column :socioeduk_relatorio_diarios, :situacao_crise_critica, :integer
    add_column :socioeduk_relatorio_diarios, :situacao_crise_complexa, :integer
  end
end
