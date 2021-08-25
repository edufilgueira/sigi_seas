class AddUrlbmStatusMapToUrlbmMapas < ActiveRecord::Migration[5.1]
  def change
    add_reference :urlbm_mapas, :urlbm_status_map, foreign_key: true
  end
end
