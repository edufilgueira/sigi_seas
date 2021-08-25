class RenameSaudeJovensToSocioedukSaudeJovem < ActiveRecord::Migration[5.1]
  def change
    rename_column :socioeduk_saude_jovens_substancias_utilizadas, :socioeduk_saude_jovens_id, :saude_jovem_id
  end
end