class AddColumnsToSocioedukMedidaSocioeducativa < ActiveRecord::Migration[5.1]
  def change
    add_reference :socioeduk_medida_socioeducativas, :socioeduk_tipo_conclusao_medida_socioeducativas, foreign_key: true, index: { name: 'tipo_conc_med_socio' }
    add_reference :socioeduk_medida_socioeducativas, :socioeduk_encaminhamento_conclusao_medida_socioeducativas, foreign_key: true, index: { name: 'encaminhamento_conc_med_socio' }
  end
end
