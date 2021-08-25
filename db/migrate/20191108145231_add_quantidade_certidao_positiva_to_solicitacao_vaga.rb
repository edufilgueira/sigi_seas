class AddQuantidadeCertidaoPositivaToSolicitacaoVaga < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_solicitacao_vagas, :pontuacao_quantidade_certidao_positiva, :integer
  end
end
