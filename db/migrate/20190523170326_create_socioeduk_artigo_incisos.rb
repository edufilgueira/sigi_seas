class CreateSocioedukArtigoIncisos < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_artigo_incisos do |t|
      t.references :socioeduk_artigo_paragrafo, foreign_key: true, index: {:name => "artigo_paragrafo_inciso"}
      t.string :descricao

      t.timestamps
    end
  end
end
