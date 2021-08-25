class RenameTelefoneToTelcontato < ActiveRecord::Migration[5.1]
  def change
    rename_column :urlbm_mapas, :telefone, :telcontato
  end
end
