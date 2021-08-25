class AddDeletedAtToUnidadeBlocoDormitorio < ActiveRecord::Migration[5.1]
  def change
    add_column :unidade_bloco_dormitorios, :deleted_at, :datetime
    add_index :unidade_bloco_dormitorios, :deleted_at
  end
end
