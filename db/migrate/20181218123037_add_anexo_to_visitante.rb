class AddAnexoToVisitante < ActiveRecord::Migration[5.1]
  def up
    add_attachment :socioeduk_visitantes, :foto
    add_attachment :socioeduk_visitantes, :anexo
  end

  def down
    remove_attachment :socioeduk_visitantes, :foto
    remove_attachment :socioeduk_visitantes, :anexo
  end
end
