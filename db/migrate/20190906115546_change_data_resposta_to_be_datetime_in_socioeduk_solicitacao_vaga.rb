class ChangeDataRespostaToBeDatetimeInSocioedukSolicitacaoVaga < ActiveRecord::Migration[5.1]
  def change
    change_column :socioeduk_solicitacao_vagas, :data_resposta, :datetime
  end
end
