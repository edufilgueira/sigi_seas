class AddDeletedAtToUrlbmStatusMap < ActiveRecord::Migration[5.1]
  def change
    add_column :urlbm_status_maps, :deleted_at, :datetime
    add_index :urlbm_status_maps, :deleted_at
  end
end
