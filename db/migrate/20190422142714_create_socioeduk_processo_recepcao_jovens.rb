class CreateSocioedukProcessoRecepcaoJovens < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_processo_recepcao_jovens do |t|
      t.references :socioeduk_processo, foreign_key: true, index: {:name => "processo_recepcao_jovem"}
      t.references :socioeduk_jovem_recepcao, foreign_key: true, index: {:name => "processo_jovem_recepcao"}

      t.timestamps
    end
  end
end
