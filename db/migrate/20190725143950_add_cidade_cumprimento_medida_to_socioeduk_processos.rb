class AddCidadeCumprimentoMedidaToSocioedukProcessos < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_processos, :cidade_cumprimento_medida, :integer
  end
end
