class AddDiasParaEfetuarCadastroToJovemRecepcao < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_jovem_recepcoes, :dias_para_efetuar_cadastro, :integer
  end
end
