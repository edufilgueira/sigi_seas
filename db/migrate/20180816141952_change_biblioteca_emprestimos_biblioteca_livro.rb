class ChangeBibliotecaEmprestimosBibliotecaLivro < ActiveRecord::Migration[5.1]
  def change
    remove_column :biblioteca_emprestimos, :biblioteca_livro, :string
    add_reference :biblioteca_emprestimos, :biblioteca_livro, foreign_key: true
  end
end
