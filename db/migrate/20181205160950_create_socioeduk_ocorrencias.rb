class CreateSocioedukOcorrencias < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_ocorrencias do |t|
      t.string :nome
      t.string :descricao
      t.references :socioeduk_tipo_ocorrencia, foreign_key: true

      t.timestamps
    end
  end
end
