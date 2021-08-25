class AddDeleteAtToSocioedukSolicitacaoVaga < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_solicitacao_vagas, :deleted_at, :datetime
  end
end
