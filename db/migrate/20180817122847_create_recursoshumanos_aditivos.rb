class CreateRecursoshumanosAditivos < ActiveRecord::Migration[5.1]
  def change
    create_table :recursoshumanos_aditivos do |t|
      t.references :recursoshumanos_contrato, foreign_key: true
      t.references :recursoshumanos_justificativa_aditivo, foreign_key: true, index: {:name => "justificativa_aditivo"}
      t.string :numero_processo
      t.string :descricao
      t.date :data

      t.timestamps
    end
  end
end
