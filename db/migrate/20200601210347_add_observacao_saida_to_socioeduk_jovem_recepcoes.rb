class AddObservacaoSaidaToSocioedukJovemRecepcoes < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_jovem_recepcoes, :observacao_saida, :text
  end
end
