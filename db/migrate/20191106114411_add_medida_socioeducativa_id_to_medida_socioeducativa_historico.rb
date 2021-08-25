class AddMedidaSocioeducativaIdToMedidaSocioeducativaHistorico < ActiveRecord::Migration[5.1]
  def change
    add_reference :socioeduk_medida_socioeducativa_historicos, :socioeduk_medida_socioeducativa, foreign_key: true, index: { name: 'medida_socioeducativa_medida_socioeducativa_historico' }
  end
end
