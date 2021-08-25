class CreateSocioedukJovemControlePertences < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_jovem_controle_pertences do |t|
      t.references :socioeduk_jovem_recepcao, foreign_key: true, index: { name: 'jovem_controle_pertence_recepcao' }
      t.string :nome
      t.date :data_entrega
      t.string :recebente
      t.string :entregador
      t.integer :usuario_new
      t.integer :usuario_update

      t.timestamps
    end
  end
end
