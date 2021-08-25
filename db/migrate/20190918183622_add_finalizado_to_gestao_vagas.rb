class AddFinalizadoToGestaoVagas < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_gestao_vagas, :finalizado, :boolean
  end
end
