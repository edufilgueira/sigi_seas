class AddAnexoToSocioedukTecnicoJovemPlanoAtendimento < ActiveRecord::Migration[5.1]
  def up
    add_attachment :socioeduk_tecnico_jovem_plano_atendimentos, :anexo
  end

  def down
    remove_attachment :socioeduk_tecnico_jovem_plano_atendimentos, :anexo
  end
end
