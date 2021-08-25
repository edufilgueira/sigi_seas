class CreateBibliotecaEditoras < ActiveRecord::Migration[5.1]
  def change
    create_table :biblioteca_editoras do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
