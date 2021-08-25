class CreateUrlbmStatusMaps < ActiveRecord::Migration[5.1]
  def change
    create_table :urlbm_status_maps do |t|
      t.string :nome_status

      t.timestamps
    end
  end
end
