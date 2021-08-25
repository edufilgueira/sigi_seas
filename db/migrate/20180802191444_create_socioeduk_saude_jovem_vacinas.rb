class CreateSocioedukSaudeJovemVacinas < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_saude_jovem_vacinas do |t|
      t.references :socioeduk_saude_jovem, foreign_key: true
      t.references :socioeduk_tipo_vacina, foreign_key: true
      t.date :data_vacinacao

      t.timestamps
    end
  end
end
