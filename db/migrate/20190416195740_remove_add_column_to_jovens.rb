class RemoveAddColumnToJovens < ActiveRecord::Migration[5.1]
  def change
      remove_column :socioeduk_jovens, :agredido
      add_column :socioeduk_jovem_recepcoes, :agredido, :text
  end
end
