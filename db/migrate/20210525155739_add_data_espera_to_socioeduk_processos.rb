class AddDataEsperaToSocioedukProcessos < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_processos, :data_espera, :datetime
  end
end
