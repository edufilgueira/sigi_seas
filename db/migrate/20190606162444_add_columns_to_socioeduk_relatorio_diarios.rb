class AddColumnsToSocioedukRelatorioDiarios < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_relatorio_diarios, :capacidade_socioeducador_por_adolescente, :string
    add_column :socioeduk_relatorio_diarios, :capacidade_socioeducador_por_adolescente_percentual, :string
    add_column :socioeduk_relatorio_diarios, :preenchido_por, :string
  end
end
