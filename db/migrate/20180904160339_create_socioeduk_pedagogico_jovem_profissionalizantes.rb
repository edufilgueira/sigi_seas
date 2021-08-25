class CreateSocioedukPedagogicoJovemProfissionalizantes < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_pedagogico_jovem_profissionalizantes do |t|
      t.references :socioeduk_pedagogico_jovem, foreign_key: true, index: {:name => "pedagogico_jovem_profissionalizante"}
      t.references :socioeduk_tipo_local_curso, foreign_key: true, index: {:name => "tipo_local_curso_profissionalizante"}
      t.string :nome_programa
      t.references :socioeduk_tipo_curso, foreign_key: true, index: {:name => "tipo_curso_profissionalizante"}
      t.string :nome_curso
      t.date :data_inicio
      t.date :data_fim
      t.string :carga_horaria
      t.text :observacao

      t.timestamps
    end
  end
end
