class AddColumnQuantidadeEntregueToItensSolilcitacaoPatrimonios < ActiveRecord::Migration[5.1]
  def change
    add_column :itens_solicitacao_patrimonios, :quantidade_entregue, :integer
  end
end
