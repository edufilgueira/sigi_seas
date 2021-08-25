class CreateSocioedukSaudeJovensTipoParentescoDoencaMentais < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_saude_jovens_tipo_parentesco_doenca_mentais do |t|
      t.references :socioeduk_saude_jovens, foreign_key: true, index: {:name => "saude_jovens"}
      t.references :socioeduk_tipo_parentesco, foreign_key: true, index: {:name => "tipo_parentesco"}

      t.timestamps
    end
  end
end
