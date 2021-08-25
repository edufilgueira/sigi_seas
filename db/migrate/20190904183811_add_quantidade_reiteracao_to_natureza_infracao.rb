class AddQuantidadeReiteracaoToNaturezaInfracao < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_processo_naturezas, :pontuacao_quantidade_reinteracao, :integer
  end
end
