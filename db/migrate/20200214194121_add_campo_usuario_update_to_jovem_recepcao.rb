class AddCampoUsuarioUpdateToJovemRecepcao < ActiveRecord::Migration[5.1]
  def change
    add_reference :socioeduk_jovem_recepcoes, :usuario, foreign_key: true
    add_column :socioeduk_jovem_recepcoes, :usuario_update_id, :integer
  end
end
