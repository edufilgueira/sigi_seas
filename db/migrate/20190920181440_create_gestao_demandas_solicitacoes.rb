class CreateGestaoDemandasSolicitacoes < ActiveRecord::Migration[5.1]
  def change
    create_table :gestao_demandas_solicitacoes do |t|
      t.string :titulo
      t.text :descricao
      t.references :usuario, foreign_key: true

      t.timestamps
    end
  end
end
