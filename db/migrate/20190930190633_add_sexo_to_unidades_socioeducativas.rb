class AddSexoToUnidadesSocioeducativas < ActiveRecord::Migration[5.1]
  def change
    add_column :unidades_socioeducativas, :sexo, :string
  end
end
