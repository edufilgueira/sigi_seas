class AddDeletedAtToUnidadeBlocoDormitorioCapacidade < ActiveRecord::Migration[5.1]
  def change
    add_column :unidade_bloco_dormitorio_capacidades, :deleted_at, :datetime
    add_index :unidade_bloco_dormitorio_capacidades, :deleted_at
  end
end
