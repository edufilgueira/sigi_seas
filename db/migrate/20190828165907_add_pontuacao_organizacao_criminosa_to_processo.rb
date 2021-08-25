class AddPontuacaoOrganizacaoCriminosaToProcesso < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_processos, :pontuacao_organizacao_criminosa, :boolean
  end
end
