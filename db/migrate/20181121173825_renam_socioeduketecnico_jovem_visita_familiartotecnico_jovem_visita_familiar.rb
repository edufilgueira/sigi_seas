class RenamSocioeduketecnicoJovemVisitaFamiliartotecnicoJovemVisitaFamiliar < ActiveRecord::Migration[5.1]
  def change
    rename_column :socioeduk_tecnico_jovem_visita_familiares, :socioeduk_tecnico_jovem_id,  :tecnico_jovem_id
  end
end
