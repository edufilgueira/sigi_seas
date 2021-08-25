class AddPontuacaoBkpToSocioedukProcessos < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_processos, :pontuacao_bkp, :numeric
  end
end
