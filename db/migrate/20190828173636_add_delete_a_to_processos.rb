class AddDeleteAToProcessos < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_processos, :deleted_at, :datetime
    add_index :socioeduk_processos, :deleted_at
  end
end
