class CreateUnidadeSocioeducativaAreas < ActiveRecord::Migration[5.1]
  def change
    create_table :unidade_socioeducativa_areas do |t|
      t.references :unidade_socioeducativa, foreign_key: true
      t.references :area, foreign_key: true

      t.timestamps
    end
  end
end
