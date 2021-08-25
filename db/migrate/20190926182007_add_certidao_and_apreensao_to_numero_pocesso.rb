class AddCertidaoAndApreensaoToNumeroPocesso < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_numero_processos, :pontuacao_certidao_positiva, :boolean
    add_column :socioeduk_numero_processos, :pontuacao_apreendido, :boolean
  end
end
