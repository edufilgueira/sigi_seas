class CreateSocioedukSaudeJovemExames < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_saude_jovem_exames do |t|
      t.references :socioeduk_saude_jovem, foreign_key: true
      t.references :socioeduk_tipo_exame, foreign_key: true
      t.date :data_exame

      t.timestamps
    end
  end
end
