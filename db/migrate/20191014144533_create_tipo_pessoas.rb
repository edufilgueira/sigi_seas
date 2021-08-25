class CreateTipoPessoas < ActiveRecord::Migration[5.1]
  def change
    create_table :tipo_pessoas do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
