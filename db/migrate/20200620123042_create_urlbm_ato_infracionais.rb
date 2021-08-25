class CreateUrlbmAtoInfracionais < ActiveRecord::Migration[5.1]
  def change
    create_table :urlbm_ato_infracionais do |t|
      t.string :tipo

      t.timestamps
    end
  end
end
