class CreateSocioedukSaudeJovensTipoParentescoSuicidios < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_saude_jovens_tipo_parentesco_suicidios do |t|
      t.references :socioeduk_saude_jovens, foreign_key: true, index: {:name => "saude_jovens_suic"}
      t.references :socioeduk_tipo_parentesco, foreign_key: true, index: {:name => "tipo_parentesco_suic"}

      t.timestamps
    end
  end
end
