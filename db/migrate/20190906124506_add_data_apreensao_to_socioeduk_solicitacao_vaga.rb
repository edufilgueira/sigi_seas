class AddDataApreensaoToSocioedukSolicitacaoVaga < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_solicitacao_vagas, :data_apreensao, :date
  end
end
