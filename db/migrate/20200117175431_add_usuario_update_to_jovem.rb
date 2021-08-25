class AddUsuarioUpdateToJovem < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_jovens, :usuario_update_id, :integer
  end
end
