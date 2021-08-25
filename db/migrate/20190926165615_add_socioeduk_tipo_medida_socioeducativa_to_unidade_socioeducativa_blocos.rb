class AddSocioedukTipoMedidaSocioeducativaToUnidadeSocioeducativaBlocos < ActiveRecord::Migration[5.1]
  def change
    add_reference :unidade_socioeducativa_blocos, :socioeduk_tipo_medida_socioeducativa, foreign_key: true, index: { name: 'tipo_medida_socioeducativa_id' }
  end
end
