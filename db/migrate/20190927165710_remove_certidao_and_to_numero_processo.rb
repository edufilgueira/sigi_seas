class RemoveCertidaoAndToNumeroProcesso < ActiveRecord::Migration[5.1]
  def change
    remove_column :socioeduk_numero_processos, :pontuacao_certidao_positiva
    remove_column :socioeduk_numero_processos, :pontuacao_apreendido
  end
end
