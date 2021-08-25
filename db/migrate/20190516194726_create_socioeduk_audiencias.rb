class CreateSocioedukAudiencias < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_audiencias do |t|
      t.references :socioeduk_processo, foreign_key: true
      t.references :socioeduk_comarca, foreign_key: true
      t.string :numero_processo
      t.datetime :datahora
      t.text :observacao

      t.timestamps
    end
  end
end
