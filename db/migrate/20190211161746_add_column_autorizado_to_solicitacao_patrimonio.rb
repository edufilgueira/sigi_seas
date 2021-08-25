class AddColumnAutorizadoToSolicitacaoPatrimonio < ActiveRecord::Migration[5.1]
  def change
    add_column :solicitacao_patrimonios, :autorizado, :boolean, default: false
  end
end
