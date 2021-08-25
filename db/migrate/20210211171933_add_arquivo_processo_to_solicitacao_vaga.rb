class AddArquivoProcessoToSolicitacaoVaga < ActiveRecord::Migration[5.1]
  def up
    add_attachment :socioeduk_solicitacao_vagas, :resposta_arquivo_processo
  end

  def down
    remove_attachment :socioeduk_solicitacao_vagas, :resposta_arquivo_processo
  end
end
