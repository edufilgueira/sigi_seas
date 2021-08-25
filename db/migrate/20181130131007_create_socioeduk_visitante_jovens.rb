class CreateSocioedukVisitanteJovens < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_visitante_jovens do |t|
      t.references :socioeduk_visitante, foreign_key: true
      t.references :socioeduk_jovem, foreign_key: true
      t.references :socioeduk_tipo_parentesco, foreign_key: true, index: {:name => "visitante_jovens_tipo_parentesco"}

      t.timestamps
    end
  end
end
