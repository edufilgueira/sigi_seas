class ChangeSocioedukJovens < ActiveRecord::Migration[5.1]
  def change
    rename_column :urlbm_mapas, :socioeduk_jovens_id, :socioeduk_jovem_id
  end
end
