class CreateSocioedukEntorpecentes < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_entorpecentes do |t|
      t.string :descricao
      t.references :unidades_medida, foreign_key: true
      t.boolean :status

      t.timestamps
    end
  end
end
