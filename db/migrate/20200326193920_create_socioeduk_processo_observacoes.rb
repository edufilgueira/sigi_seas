class CreateSocioedukProcessoObservacoes < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_processo_observacoes do |t|
      t.references :socioeduk_processo, foreign_key: true
      t.text :observacao

      t.timestamps
    end
  end
end
