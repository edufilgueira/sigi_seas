class AlterFieldsToSocioedukJovemItemPertences < ActiveRecord::Migration[5.1]
  def change
    remove_column :socioeduk_jovem_item_pertences, :data_entrega
    remove_column :socioeduk_jovem_item_pertences, :date
    add_column :socioeduk_jovem_item_pertences, :data_entrega, :date
    remove_column :socioeduk_jovem_controle_pertences, :data_entrega
    remove_column :socioeduk_jovem_controle_pertences, :recebente
    remove_column :socioeduk_jovem_controle_pertences, :entregador
    remove_column :socioeduk_jovem_controle_pertences, :usuario_new
    remove_column :socioeduk_jovem_controle_pertences, :usuario_update
  end
end
