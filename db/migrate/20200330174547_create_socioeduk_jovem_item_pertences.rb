class CreateSocioedukJovemItemPertences < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_jovem_item_pertences do |t|
      t.references :socioeduk_jovem_controle_pertence, foreign_key: true, index: { name: 'socioeduk_jovem_item_pertences_item' }
      t.string :nome
      t.string :data_entrega
      t.string :date
      t.string :recebente
      t.string :entregador
      t.integer :usuario_new
      t.integer :usuario_update

      t.timestamps
    end
  end
end
