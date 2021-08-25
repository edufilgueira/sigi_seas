class AddColumnsToSocioedukSolicitacaoVaga < ActiveRecord::Migration[5.1]
  def change
    add_reference :socioeduk_solicitacao_vagas, :socioeduk_tipo_medida_socioeducativa, foreign_key: true, index: { name: 'solicitacao_vaga_tipo_medida_socieducativa' }
    add_column :socioeduk_solicitacao_vagas, :status, :string
    add_column :socioeduk_solicitacao_vagas, :respondido_por, :integer
    add_column :socioeduk_solicitacao_vagas, :data_resposta, :date
    add_column :socioeduk_solicitacao_vagas, :motivo_negacao, :text
  end
end
