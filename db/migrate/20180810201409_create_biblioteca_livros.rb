class CreateBibliotecaLivros < ActiveRecord::Migration[5.1]
  def change
    create_table :biblioteca_livros do |t|
      t.string :titulo
      t.text :sinopse
      t.references :biblioteca_autor, foreign_key: true
      t.references :biblioteca_local, foreign_key: true
      t.boolean :status

      t.timestamps
    end
  end
end
