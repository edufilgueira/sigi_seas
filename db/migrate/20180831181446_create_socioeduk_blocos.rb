class CreateSocioedukBlocos < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_blocos do |t|
      t.references :unidade_socioeducativa, foreign_key: true
      t.string :descricao

      t.timestamps
    end
  end
end
