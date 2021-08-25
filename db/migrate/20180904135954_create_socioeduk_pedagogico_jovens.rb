class CreateSocioedukPedagogicoJovens < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_pedagogico_jovens do |t|
      t.references :socioeduk_jovem, foreign_key: true
      t.references :socioeduk_tipo_alfabetizado, foreign_key: true, index: {:name => "tipo_alfabetizado_pedagogico_jovens"}
      t.references :socioeduk_situacao_escolar, foreign_key: true, index: {:name => "situacao_escolar_pedagogico_jovens"}
      t.references :socioeduk_escolaridade, foreign_key: true
      t.string :ultima_escola_frequentada
      t.integer :ultimo_ano_escolar
      t.string :cgm
      t.integer :socioeduk_situacao_ocupacional_anterior
      t.integer :socioeduk_situacao_ocupacional_atual

      t.timestamps
    end
  end
end
