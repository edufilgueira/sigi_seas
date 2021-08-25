class RemoveColumnsToVisitante < ActiveRecord::Migration[5.1]
  def up
    remove_column :socioeduk_visitantes, :foto
    remove_column :socioeduk_visitantes, :anexo
  end
  
  def down
    add_column :socioeduk_visitantes, :foto, :string
    add_column :socioeduk_visitantes, :anexo, :string
  end
end
