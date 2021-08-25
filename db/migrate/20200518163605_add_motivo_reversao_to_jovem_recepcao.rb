class AddMotivoReversaoToJovemRecepcao < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_jovem_recepcoes, :motivo_reversao, :text
    add_column :socioeduk_jovem_recepcoes, :usuario_id_reversao, :integer
  end
end
