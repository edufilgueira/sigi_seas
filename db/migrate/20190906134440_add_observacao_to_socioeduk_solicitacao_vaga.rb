class AddObservacaoToSocioedukSolicitacaoVaga < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_solicitacao_vagas, :observacao, :text
  end
end
