class RemoveSocioedukMunicipioToSocioedukProcessos < ActiveRecord::Migration[5.1]
  def change
    remove_column :socioeduk_processos, :socioeduk_municipio_id
  end
end
