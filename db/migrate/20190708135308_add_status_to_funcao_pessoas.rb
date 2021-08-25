class AddStatusToFuncaoPessoas < ActiveRecord::Migration[5.1]
  def change
    add_column :funcao_pessoas, :status, :boolean
  end
end
