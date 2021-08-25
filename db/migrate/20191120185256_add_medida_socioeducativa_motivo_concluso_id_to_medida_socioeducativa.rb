class AddMedidaSocioeducativaMotivoConclusoIdToMedidaSocioeducativa < ActiveRecord::Migration[5.1]
  def change
    add_reference :socioeduk_medida_socioeducativas, :socioeduk_medida_socioeducativa_motivo_conclusao, foreign_key: true, index: { name: 'medida_socioeducativa_motivo_conclusao' }
  end
end
