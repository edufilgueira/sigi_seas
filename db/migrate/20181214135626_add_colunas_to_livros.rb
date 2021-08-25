class AddColunasToLivros < ActiveRecord::Migration[5.1]
  def change
    add_reference :biblioteca_livros, :biblioteca_local_publicacao, foreign_key: true
    add_reference :biblioteca_livros, :biblioteca_editora, foreign_key: true
    add_column :biblioteca_livros, :data_publicacao, :date
    add_column :biblioteca_livros, :paginacao, :integer
    add_column :biblioteca_livros, :assunto1, :string
    add_column :biblioteca_livros, :assunto2, :string
    add_column :biblioteca_livros, :css_cdu, :string
    add_column :biblioteca_livros, :isbn, :string
    add_column :biblioteca_livros, :cutter, :string
  end
end
