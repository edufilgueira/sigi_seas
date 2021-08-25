class AddDescumprimentoOrganizacaoCertidaoAndToNumeroProcesso < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_numero_processos, :pontuacao_descumprimento_medida, :boolean
    add_column :socioeduk_numero_processos, :pontuacao_organizacao_criminosa, :boolean
  end
end
