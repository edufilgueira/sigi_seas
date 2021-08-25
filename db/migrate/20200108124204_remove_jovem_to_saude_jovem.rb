class RemoveJovemToSaudeJovem < ActiveRecord::Migration[5.1]
  def change
    remove_column :socioeduk_saude_jovens, :socioeduk_jovem_id
  end
end
