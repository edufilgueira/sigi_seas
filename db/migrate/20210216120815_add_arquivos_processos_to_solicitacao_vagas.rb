class AddArquivosProcessosToSolicitacaoVagas < ActiveRecord::Migration[5.1]
  def up
    add_attachment :socioeduk_solicitacao_vagas, :resposta_arquivo_processo2
    add_attachment :socioeduk_solicitacao_vagas, :resposta_arquivo_processo3
    add_attachment :socioeduk_solicitacao_vagas, :resposta_arquivo_processo4
  end

  def down
    remove_attachment :socioeduk_solicitacao_vagas, :resposta_arquivo_processo2
    remove_attachment :socioeduk_solicitacao_vagas, :resposta_arquivo_processo3
    remove_attachment :socioeduk_solicitacao_vagas, :resposta_arquivo_processo4
  end
end
