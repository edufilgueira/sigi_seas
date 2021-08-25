class AddColumnSancaoToRelatorioDiarios < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_relatorio_diarios, :san_mas, :integer
    add_column :socioeduk_relatorio_diarios, :san_fem, :integer
  end
end
