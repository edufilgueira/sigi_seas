class RemoveDataNascimentoFromUrlbmMapa < ActiveRecord::Migration[5.1]
  def change
    remove_column :urlbm_mapas, :data_nascimento, :string
  end
end
