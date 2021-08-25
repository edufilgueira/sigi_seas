class CreateSocioedukMetodoContraceptivos < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_metodo_contraceptivos do |t|
      t.string :descricao
      t.boolean :ativo

      t.timestamps
    end
  end
end
