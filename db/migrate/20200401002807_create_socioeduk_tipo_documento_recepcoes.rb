class CreateSocioedukTipoDocumentoRecepcoes < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_tipo_documento_recepcoes do |t|
      t.string :tipo_documento_recepcao

      t.timestamps
    end
  end
end
