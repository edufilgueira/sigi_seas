class AddDataSaidaToSocioedukJovemRecepcao < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_jovem_recepcoes, :data_saida, :date
  end
end
