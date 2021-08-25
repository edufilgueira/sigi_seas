class CreateSocioedukJovemOcorrencias < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_jovem_ocorrencias do |t|
      t.references :socioeduk_jovem, foreign_key: true
      t.references :socioeduk_tipo_ocorrencia, foreign_key: true, index: {:name => "tipo_ocorrencia_jovem_ocorrencias"}
      t.datetime :data_hora
      t.string :descricao

      t.timestamps
    end
  end
end
