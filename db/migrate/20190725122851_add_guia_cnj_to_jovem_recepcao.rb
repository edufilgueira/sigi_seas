class AddGuiaCnjToJovemRecepcao < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_jovem_recepcoes, :recepcao_origem, :string
    add_column :socioeduk_jovem_recepcoes, :guia_cnj, :boolean
  end
end
