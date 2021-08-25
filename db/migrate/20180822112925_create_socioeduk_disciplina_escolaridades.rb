class CreateSocioedukDisciplinaEscolaridades < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_disciplina_escolaridades do |t|
      t.references :socioeduk_escolaridade, foreign_key: true, index: {:name => "disciplina_escolaridades"}
      t.string :descricao

      t.timestamps
    end
  end
end
