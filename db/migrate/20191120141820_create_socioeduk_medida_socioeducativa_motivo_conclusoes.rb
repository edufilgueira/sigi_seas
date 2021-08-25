class CreateSocioedukMedidaSocioeducativaMotivoConclusoes < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_medida_socioeducativa_motivo_conclusoes do |t|
      t.references :socioeduk_tipo_medida_socioeducativa, index: { name: 'tipo_medida_motivo_conclusão' }
      t.references :socioeduk_tipo_conclusao_medida_socioeducativa, index: { name: 'tipo_conclusao_medida_motivo_conclusão' }
      t.timestamps
    end
  end
end
