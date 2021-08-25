class AddAnexoToSocioedukTecnicoJovemUltimoRelatorio < ActiveRecord::Migration[5.1]
  def up
    add_attachment :socioeduk_tecnico_jovem_ultimo_relatorios, :foto
    add_attachment :socioeduk_tecnico_jovem_ultimo_relatorios, :anexo
  end

  def down
    remove_attachment :socioeduk_tecnico_jovem_ultimo_relatorios, :foto
    remove_attachment :socioeduk_tecnico_jovem_ultimo_relatorios, :anexo
  end
end
