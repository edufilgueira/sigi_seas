class CreateSocioedukEscolaridades < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_escolaridades do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
