class CreateBibliotecaAutores < ActiveRecord::Migration[5.1]
  def change
    create_table :biblioteca_autores do |t|
      t.string :nome

      t.timestamps
    end
  end
end
