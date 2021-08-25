class AddSocioedukTipoMedidaSocioeducativaToSocioedukJovemRecepcoes < ActiveRecord::Migration[5.1]
  def change
    add_reference :socioeduk_jovem_recepcoes, :socioeduk_tipo_medida_socioeducativa, foreign_key: true, index: {:name => "index_socioeduk_jov_recep_on_socioeduk_tipo_medida_socioedu_id"}
  end
end
