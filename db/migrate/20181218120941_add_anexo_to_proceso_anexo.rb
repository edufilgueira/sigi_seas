class AddAnexoToProcesoAnexo < ActiveRecord::Migration[5.1]
  def up
    add_attachment :socioeduk_processo_anexos, :anexo
  end

  def down
    remove_attachment :socioeduk_processo_anexos, :anexo
  end
end
