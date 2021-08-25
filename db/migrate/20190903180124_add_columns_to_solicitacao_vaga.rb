class AddColumnsToSolicitacaoVaga < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_solicitacao_vagas, :data_infracao, :date
    add_column :socioeduk_solicitacao_vagas, :pontuacao_reinteracao, :boolean
    add_column :socioeduk_solicitacao_vagas, :pontuacao_certidao_positiva, :boolean
    add_column :socioeduk_solicitacao_vagas, :pontuacao_apreendido, :boolean
    add_column :socioeduk_solicitacao_vagas, :pontuacao_descumprimento_medida, :boolean
    add_column :socioeduk_solicitacao_vagas, :pontuacao_organizacao_criminosa, :boolean
    add_reference :socioeduk_solicitacao_vagas, :usuario, foreign_key: true
  end
end
