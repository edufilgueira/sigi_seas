class CreateSocioedukTecnicoJovemVisitaFamiliares < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_tecnico_jovem_visita_familiares do |t|
      t.references :socioeduk_tecnico_jovem, foreign_key: true, index: {:name => "tecnico_jovem_visita_familiar"}
      t.date :data_visita
      t.string :pessoa_visitada
      t.text :finalidade_visita
      t.string :responsavel_realizacao

      t.timestamps
    end
  end
end
