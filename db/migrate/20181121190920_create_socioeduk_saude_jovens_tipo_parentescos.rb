class CreateSocioedukSaudeJovensTipoParentescos < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_saude_jovens_tipo_parentescos do |t|
      t.references :socioeduk_saude_jovem, foreign_key: true, index: {:name => "saude_jovem_tipo_parentescos"}
      t.references :socioeduk_tipo_parentesco, foreign_key: true, index: {:name => "saude_jovem_tipo_parentesco"}

      t.timestamps
    end
  end
end
