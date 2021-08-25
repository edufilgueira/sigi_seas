class CreateSocioedukPedagogicoJovemEscolaridadeMedidas < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_pedagogico_jovem_escolaridade_medidas do |t|
      t.references :socioeduk_pedagogico_jovem, foreign_key: true, index: {:name => "pedagogico_jovem_escolaridade_medidas"}
      t.references :socioeduk_escolaridade, foreign_key: true, index: {:name => "escolaridade_escolaridade_medidas"}
      t.references :socioeduk_tipo_local_curso, foreign_key: true, index: {:name => "tipo_local_curso_escolaridade_medidas"}
      t.string :escola
      t.integer :ano

      t.timestamps
    end
  end
end
