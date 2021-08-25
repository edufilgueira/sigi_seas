class CreateSocioedukTecnicoJovemUltimoRelatorios < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_tecnico_jovem_ultimo_relatorios do |t|
      t.references :socioeduk_tecnico_jovem, foreign_key: true, index: {:name => "tecnico_jovem_ultimo_relatorios"}
      t.references :socioeduk_sugestao_relatorio, foreign_key: true, index: {:name => "sugestao_relatorio_ultimo_relatorios"}
      t.date :data_inclusao
      t.references :socioeduk_tipo_retorno, foreign_key: true, index: {:name => "tipo_retorno_ultimo_relatorios"}
      t.integer :unidade_socioeducativa_inclusao_id

      t.timestamps
    end
  end
end
