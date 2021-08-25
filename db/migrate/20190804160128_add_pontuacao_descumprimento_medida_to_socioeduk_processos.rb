class AddPontuacaoDescumprimentoMedidaToSocioedukProcessos < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_processos, :pontuacao_descumprimento_medida, :boolean
  end
end
