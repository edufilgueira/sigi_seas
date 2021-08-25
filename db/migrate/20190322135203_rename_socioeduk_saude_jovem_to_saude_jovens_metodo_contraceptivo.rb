class RenameSocioedukSaudeJovemToSaudeJovensMetodoContraceptivo < ActiveRecord::Migration[5.1]
  def change
    rename_column :socioeduk_saude_jovens_metodos_contraceptivos, :socioeduk_saude_jovem_id,  :saude_jovem_id
  end
end
