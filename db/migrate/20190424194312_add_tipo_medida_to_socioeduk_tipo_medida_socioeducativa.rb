class AddTipoMedidaToSocioedukTipoMedidaSocioeducativa < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_tipo_medida_socioeducativas, :tipo_medida, :string
  end
end
