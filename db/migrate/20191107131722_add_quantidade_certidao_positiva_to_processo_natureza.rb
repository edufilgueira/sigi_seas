class AddQuantidadeCertidaoPositivaToProcessoNatureza < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_processos, :pontuacao_quantidade_certidao_positiva, :integer
  end
end
