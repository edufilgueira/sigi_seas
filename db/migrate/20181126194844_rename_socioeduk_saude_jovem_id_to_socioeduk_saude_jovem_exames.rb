class RenameSocioedukSaudeJovemIdToSocioedukSaudeJovemExames < ActiveRecord::Migration[5.1]
  def change
    rename_column :socioeduk_saude_jovem_exames, :socioeduk_saude_jovem_id,  :saude_jovem_id
  end
end
