class AddColumnCidadeToUnidadeSocioeducativa < ActiveRecord::Migration[5.1]
  def change
    add_reference :unidades_socioeducativas, :cidade, foreign_key: true
  end
end
