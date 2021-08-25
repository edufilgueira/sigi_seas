class RemoveAddJovemRecepcaoToGestaoVagas < ActiveRecord::Migration[5.1]
  def change
    remove_column :socioeduk_gestao_vagas, :socioeduk_jovem_id, :integer
    add_column :socioeduk_gestao_vagas, :socioeduk_jovem_recepcao_id, :integer
  end
end
