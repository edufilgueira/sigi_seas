class AddDeletedAtToGestaoVaga < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_gestao_vagas, :reversao, :boolean
    add_column :socioeduk_gestao_vagas, :usuario_id_reversao, :integer
    add_column :socioeduk_gestao_vagas, :deleted_at, :datetime
    add_index :socioeduk_gestao_vagas, :deleted_at
  end
end
