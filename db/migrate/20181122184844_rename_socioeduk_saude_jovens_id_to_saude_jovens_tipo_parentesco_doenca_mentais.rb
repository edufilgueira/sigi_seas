class RenameSocioedukSaudeJovensIdToSaudeJovensTipoParentescoDoencaMentais < ActiveRecord::Migration[5.1]
  def change
    rename_column :socioeduk_saude_jovens_tipo_parentesco_doenca_mentais, :socioeduk_saude_jovens_id,  :saude_jovem_id
  end
end
