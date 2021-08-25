class AddAttachmentAnexoToAditivos < ActiveRecord::Migration[5.1]
  def up
    add_attachment :recursoshumanos_aditivos, :anexo
  end

  def down
    remove_attachment :recursoshumanos_aditivos, :anexo
  end
end