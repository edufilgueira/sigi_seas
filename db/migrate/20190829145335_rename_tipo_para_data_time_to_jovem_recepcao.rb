class RenameTipoParaDataTimeToJovemRecepcao < ActiveRecord::Migration[5.1]
  def change
    change_column :socioeduk_jovem_recepcoes, :datahora_apresentacao, 'timestamp USING CAST(datahora_apresentacao AS timestamp)'
  end
end
