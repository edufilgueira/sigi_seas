class CreateSocioedukArtigoParagrafos < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_artigo_paragrafos do |t|
      t.references :socioeduk_artigo_infracao, foreign_key: true, index: {:name => "artigo_infracao_paragrafo"}
      t.string :descricao

      t.timestamps
    end
  end
end
