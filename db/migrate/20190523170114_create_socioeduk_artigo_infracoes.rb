class CreateSocioedukArtigoInfracoes < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_artigo_infracoes do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
