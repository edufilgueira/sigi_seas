class AddStatusToUsuarios < ActiveRecord::Migration[5.1]
  def change
    add_column :usuarios, :status, :string, :default => 'ativo'
  end
end
