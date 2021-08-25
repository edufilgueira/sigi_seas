class AddStatusToJovemRecepcao < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_jovem_recepcoes, :status, :boolean, default: true
  end
end
