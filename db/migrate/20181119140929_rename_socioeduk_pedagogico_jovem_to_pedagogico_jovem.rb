class RenameSocioedukPedagogicoJovemToPedagogicoJovem < ActiveRecord::Migration[5.1]
  def change
    rename_column :socioeduk_pedagogico_jovem_escolaridade_medidas, :socioeduk_pedagogico_jovem_id,  :pedagogico_jovem_id
  end
end
