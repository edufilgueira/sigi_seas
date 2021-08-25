class CreateRecursoshumanosJustificativaAditivos < ActiveRecord::Migration[5.1]
  def change
    create_table :recursoshumanos_justificativa_aditivos do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
