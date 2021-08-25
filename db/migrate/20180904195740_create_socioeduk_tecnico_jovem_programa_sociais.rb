class CreateSocioedukTecnicoJovemProgramaSociais < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_tecnico_jovem_programa_sociais do |t|
      t.references :socioeduk_tecnico_jovem, foreign_key: true, index: {:name => "tecnico_jovem_programa_social"}
      t.references :socioeduk_programa_social, foreign_key: true, index: {:name => "programa_social_programa_social"}

      t.timestamps
    end
  end
end
