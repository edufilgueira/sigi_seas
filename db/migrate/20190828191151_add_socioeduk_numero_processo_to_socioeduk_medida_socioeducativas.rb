class AddSocioedukNumeroProcessoToSocioedukMedidaSocioeducativas < ActiveRecord::Migration[5.1]
  def change
    add_reference :socioeduk_medida_socioeducativas, :socioeduk_numero_processo, foreign_key: true, index: { name: 'numero_processo' }
  end
end
