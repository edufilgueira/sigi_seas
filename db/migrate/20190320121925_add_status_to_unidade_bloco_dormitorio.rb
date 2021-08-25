class AddStatusToUnidadeBlocoDormitorio < ActiveRecord::Migration[5.1]
  def change
    add_column :unidade_bloco_dormitorios, :status, :boolean, default: true
  end
end
