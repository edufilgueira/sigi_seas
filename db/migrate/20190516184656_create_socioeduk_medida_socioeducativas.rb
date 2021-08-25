class CreateSocioedukMedidaSocioeducativas < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_medida_socioeducativas do |t|
      t.references :socioeduk_processo, foreign_key: true, foreign_key: true, index: {:name => "processo_medida"}
      t.references :socioeduk_tipo_medida_socioeducativa, foreign_key: true, index: {:name => "tipo_medida_socioeducativa_medida"}
      t.references :socioeduk_situacao_cumprimento, foreign_key: true, index: {:name => "situacao_cumprimento_infracoes_medida"}
      t.references :socioeduk_circunstancia, foreign_key: true, index: {:name => "circunstancia_medida"}
      t.date :inicio
      t.date :fim_previsto
      t.integer :periodo_dias

      t.timestamps
    end
  end
end
