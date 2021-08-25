class AddDeletedAtToUrlbmMapa < ActiveRecord::Migration[5.1]
  def change
    add_column :urlbm_mapas, :deleted_at, :datetime
    add_index :urlbm_mapas, :deleted_at
  end
end
