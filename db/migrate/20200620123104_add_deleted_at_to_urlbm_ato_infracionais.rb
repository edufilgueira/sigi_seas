class AddDeletedAtToUrlbmAtoInfracionais < ActiveRecord::Migration[5.1]
  def change
    add_column :urlbm_ato_infracionais, :deleted_at, :datetime
    add_index :urlbm_ato_infracionais, :deleted_at
  end
end
