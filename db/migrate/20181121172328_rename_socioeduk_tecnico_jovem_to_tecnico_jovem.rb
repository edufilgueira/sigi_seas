class RenameSocioedukTecnicoJovemToTecnicoJovem < ActiveRecord::Migration[5.1]
  def change
    rename_column :socioeduk_tecnico_jovem_programa_sociais, :socioeduk_tecnico_jovem_id,  :tecnico_jovem_id
  end
end
