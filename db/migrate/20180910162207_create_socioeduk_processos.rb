class CreateSocioedukProcessos < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_processos do |t|
      t.string :numero_processo
      t.references :socioeduk_tipo_processo, foreign_key: true
      t.references :socioeduk_comarca, foreign_key: true
      t.date :data_representacao
      t.date :data_decisao
      t.string :numero_oficio
      t.date :data_oficio
      t.references :socioeduk_situacao_processo, foreign_key: true
      t.references :socioeduk_municipio, foreign_key: true
      t.datetime :data_hora_infracao
      t.datetime :data_hora_apreensao

      t.timestamps
    end
  end
end
