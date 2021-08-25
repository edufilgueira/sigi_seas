class AddMotivoTransferenciaToSocioedukGestaoVagas < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_gestao_vagas, :motivo_transferencia, :text
  end
end
