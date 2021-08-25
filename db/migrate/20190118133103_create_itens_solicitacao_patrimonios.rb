class CreateItensSolicitacaoPatrimonios < ActiveRecord::Migration[5.1]
  def change
    create_table :itens_solicitacao_patrimonios do |t|
      t.references :solicitacao_patrimonio, foreign_key: true, index: {:name => "index_itens_solicitacao_patrimonios_on_solicitacao_patrimoni_id"}
      t.references :item_patrimonio, foreign_key: true
      t.integer :quantidade_solicitada

      t.timestamps
    end
  end
end
