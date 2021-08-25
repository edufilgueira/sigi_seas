class AddRepresentacaoMinisterialToSocioedukJovemRecepcoes < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_jovem_recepcoes, :representacao_ministerial, :boolean
  end
end
