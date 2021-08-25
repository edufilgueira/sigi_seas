class AddDataProvidenciaDocumentoToSocioedukJovens < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_jovens, :data_providencia_documento, :date
  end
end
