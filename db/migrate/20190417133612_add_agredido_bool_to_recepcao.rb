class AddAgredidoBoolToRecepcao < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_jovem_recepcoes, :agredido_bool, :boolean
  end
end
