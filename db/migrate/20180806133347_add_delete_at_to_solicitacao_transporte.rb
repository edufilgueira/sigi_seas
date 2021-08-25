class AddDeleteAtToSolicitacaoTransporte < ActiveRecord::Migration[5.1]
  def change
    add_column :solicitacao_transportes, :deleted_at, :datetime
    add_index :solicitacao_transportes, :deleted_at
  end
end
