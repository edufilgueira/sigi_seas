class AddOutraInfracaoToSolicitacaoVagaInfracoes < ActiveRecord::Migration[5.1]
  def change
    add_reference :socioeduk_solicitacao_vaga_infracoes, :cidade, foreign_key: true
    add_reference :socioeduk_solicitacao_vaga_infracoes, :bairro, foreign_key: true
    add_column :socioeduk_solicitacao_vaga_infracoes, :outra_infracao, :string
    add_column :socioeduk_solicitacao_vaga_infracoes, :flagrante, :boolean
    add_column :socioeduk_solicitacao_vaga_infracoes, :data_apreensao, :date    
    add_column :socioeduk_solicitacao_vaga_infracoes, :data_ato_infracional, :date 
  end
end
