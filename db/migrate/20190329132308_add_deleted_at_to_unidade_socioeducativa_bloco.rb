class AddDeletedAtToUnidadeSocioeducativaBloco < ActiveRecord::Migration[5.1]
  def change
    add_column :unidade_socioeducativa_blocos, :deleted_at, :datetime
    add_index :unidade_socioeducativa_blocos, :deleted_at
  end
end
