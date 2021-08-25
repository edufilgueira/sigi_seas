class CreateSocioedukJovemApreensoes < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_jovem_apreensoes do |t|
      t.references :socioeduk_jovem, foreign_key: true
      t.boolean :antecedente_criminal
      t.integer :qtd_processo_anterior
      t.datetime :data_hora_entrada_delegacia
      t.integer :dia_delegacia
      t.references :socioeduk_tipo_medida_socioeducativa, foreign_key: true, index: {:name => "tipo_medida_socioeducativa_jovem_apreensoes"}
      t.references :socioeduk_tipo_decisao_judicial, foreign_key: true, index: {:name => "tipo_decisao_judicial_jovem_apreensoes"}
      t.integer :qtd_dia_internacao_medida

      t.timestamps
    end
  end
end
