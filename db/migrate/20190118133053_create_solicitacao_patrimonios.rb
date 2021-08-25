class CreateSolicitacaoPatrimonios < ActiveRecord::Migration[5.1]
  def change
    create_table :solicitacao_patrimonios do |t|
      t.string :numero_solicitacao
      t.integer :solicitante
      t.text :justificativa
      t.text :observacao

      t.timestamps
    end
  end
end
