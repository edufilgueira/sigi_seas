class CreateSocioedukSaudeJovensParentesViciados < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_saude_jovens_parentes_viciados do |t|
      t.references :socioeduk_saude_jovens, foreign_key: true, index: {:name => "saude_jovens_viciado"}
      t.references :socioeduk_tipo_parentesco, foreign_key: true, index: {:name => "tipo_parentesco_viciado"}
       t.references :socioeduk_entorpecente, foreign_key: true, index: {:name => "entorpecente_viciado"}

      t.timestamps
    end
  end
end