class AddDataGestaoVagas < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_gestao_vagas, :data_movimentacao, :date
  end
end
