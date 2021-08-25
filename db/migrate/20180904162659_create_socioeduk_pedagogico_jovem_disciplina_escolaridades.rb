class CreateSocioedukPedagogicoJovemDisciplinaEscolaridades < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_pedagogico_jovem_disciplina_escolaridades do |t|
      t.references :socioeduk_pedagogico_jovem, foreign_key: true, index: {:name => "pedagogico_jovem_disciplina_escolaridade"}
      t.references :socioeduk_disciplina_escolaridade, foreign_key: true, index: {:name => "disciplina_escolaridade_disciplina_escolaridade"}
      t.references :socioeduk_situacao_disciplina, foreign_key: true, index: {:name => "situacao_disciplina_disciplina_escolaridade"}
      t.date :data_conclusao
      t.text :observacao

      t.timestamps
    end
  end
end
