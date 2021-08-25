class CreateSocioedukMedidaSocioeducativaHistoricos < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_medida_socioeducativa_historicos do |t|
      t.references :socioeduk_processo, index: { name: 'processo_medida_socioeducativa_historico' }
      t.references :socioeduk_tipo_medida_socioeducativa, index: { name: 'tipo_medida_socioeducativa_medida_socioeducativa_historico' }
      t.references :socioeduk_situacao_cumprimento, index: { name: 'situacao_cumprimento_medida_socioeducativa_historico' }
      t.references :socioeduk_circunstancia, index: { name: 'circunstancia_medida_socioeducativa_historico' }
      t.date :inicio
      t.date :fim_previsto
      t.integer :periodo_dias
      t.references :socioeduk_tipo_conclusao_medida_socioeducativas, index: { name: 'tipo_conclusao_medida_medida_socioeducativa_historico' }
      t.references :socioeduk_encaminhamento_conclusao_medida_socioeducativas, index: { name: 'encaminhamento_conclusao_medida_socioeducativa_historico' }
      t.date :data_conclusao
      t.text :observacao_conclusao
      t.references :socioeduk_numero_processo, index: { name: 'numero_processo_medida_socioeducativa_historico' }
      t.date :data_sentenca_conclusao
      t.date :data_sentenca
      t.date :data_decisao

      t.timestamps
    end
  end
end
