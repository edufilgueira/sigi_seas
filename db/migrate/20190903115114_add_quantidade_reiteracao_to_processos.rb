class AddQuantidadeReiteracaoToProcessos < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_processos, :pontuacao_quantidade_reinteracao, :integer
  end
end
