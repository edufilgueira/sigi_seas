class CreateSocioedukProcessoRecepcaoJovemInfracoes < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_processo_recepcao_jovem_infracoes do |t|
      t.references :socioeduk_processo_recepcao_jovem, foreign_key: true, index: {:name => "processo_recepcao_jovem_infracoes"}
      #t.references :socioeduk_medida_socioeducativa, foreign_key: true, index: {:name => "medida_socioeducativa_infracoes"}
      t.boolean :reincidente
      t.boolean :cumpre_medida
      t.boolean :mandato_apreencao

      t.timestamps
    end
  end
end
