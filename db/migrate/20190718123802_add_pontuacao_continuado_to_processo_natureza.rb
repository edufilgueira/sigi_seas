class AddPontuacaoContinuadoToProcessoNatureza < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_processo_naturezas, :pontuacao_continuado, :boolean
  end
end
