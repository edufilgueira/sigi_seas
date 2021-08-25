class CreateSocioedukArtigoAlineas < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_artigo_alineas do |t|
      t.references :socioeduk_artigo_inciso, foreign_key: true, index: {:name => "artigo_inciso_alinea"}
      t.string :descricao

      t.timestamps
    end
  end
end
