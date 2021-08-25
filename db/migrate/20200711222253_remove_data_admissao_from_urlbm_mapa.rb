class RemoveDataAdmissaoFromUrlbmMapa < ActiveRecord::Migration[5.1]
  def change
    remove_column :urlbm_mapas, :data_admissao, :string
  end
end
