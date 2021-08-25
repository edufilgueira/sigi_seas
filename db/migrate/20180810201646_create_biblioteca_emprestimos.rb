class CreateBibliotecaEmprestimos < ActiveRecord::Migration[5.1]
  def change
    create_table :biblioteca_emprestimos do |t|
      t.string :biblioteca_livro
      t.references :pessoa, foreign_key: true
      t.integer :status
      t.date :data
      t.text :nota
      t.references :usuario, foreign_key: true

      t.timestamps
    end
  end
end
