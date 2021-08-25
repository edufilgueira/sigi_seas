class AddEncaminhamentoConclusaoMedidaSocioeducativaToMedidaSocioeducativa < ActiveRecord::Migration[5.1]
  def change
    add_reference :socioeduk_medida_socioeducativa_historicos, :socioeduk_medida_socioeducativa_motivo_conclusao, foreign_key: true, index: { name: 'medida_socioeducativa_motivo_conclusoes_historico' }
  end
end
