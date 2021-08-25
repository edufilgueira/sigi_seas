class RemoveSocioedukJovemFromUrlbmMapa < ActiveRecord::Migration[5.1]
  def change
    remove_reference :urlbm_mapas, :socioeduk_jovem, foreign_key: true
  end
end
