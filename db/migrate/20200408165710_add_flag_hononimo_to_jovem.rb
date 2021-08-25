class AddFlagHononimoToJovem < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_jovens, :flag_hononimo, :boolean
  end
end
