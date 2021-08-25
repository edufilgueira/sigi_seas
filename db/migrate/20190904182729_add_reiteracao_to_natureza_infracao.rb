class AddReiteracaoToNaturezaInfracao < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_processo_naturezas, :pontuacao_reinteracao, :boolean
    remove_column :socioeduk_processos, :pontuacao_reinteracao
  end
end
