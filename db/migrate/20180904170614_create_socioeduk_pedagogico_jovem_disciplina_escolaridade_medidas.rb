class CreateSocioedukPedagogicoJovemDisciplinaEscolaridadeMedidas < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_pedagogico_jovem_disciplina_escolaridade_medidas do |t|
      t.references :socioeduk_pedagogico_jovem_escolaridade_medida, foreign_key: true, index: {:name => "pedagogico_jovem_escolaridade_medida"}
      t.references :socioeduk_escolaridade, foreign_key: true, index: {:name => "escolaridade_escolaridade_medida"}
      t.references :socioeduk_situacao_disciplina, foreign_key: true, index: {:name => "situacao_disciplina_escolaridade_medida"}
      t.date :data_situacao
      t.text :observacao

      t.timestamps
    end
  end
end
