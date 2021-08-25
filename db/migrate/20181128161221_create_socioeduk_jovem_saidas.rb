class CreateSocioedukJovemSaidas < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_jovem_saidas do |t|
      t.references :socioeduk_jovem, foreign_key: true
      t.datetime :data_hora
      t.string :destino
      t.text :observacao

      t.timestamps
    end
  end
end
