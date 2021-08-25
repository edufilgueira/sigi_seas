class AddColumnToBibliotecaEmprestimo < ActiveRecord::Migration[5.1]
  def change
    add_column :biblioteca_emprestimos, :data_retorno, :date
  end
end
