class CreateRecursoshumanosCargoAditivos < ActiveRecord::Migration[5.1]
  def change
    create_table :recursoshumanos_cargo_aditivos do |t|
      t.references :recursoshumanos_cargo, foreign_key: true, index: {:name => "rh_cargo_aditivo"}
      t.references :recursoshumanos_aditivo, foreign_key: true, index: {:name => "rh_aditivo"}
      t.integer :qtd_anterior
      t.string :operacao
      t.integer :qtd_adicionado
      t.integer :qtd_atual

      t.timestamps
    end
  end
end