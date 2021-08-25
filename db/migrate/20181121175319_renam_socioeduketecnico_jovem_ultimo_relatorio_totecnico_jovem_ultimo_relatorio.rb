class RenamSocioeduketecnicoJovemUltimoRelatorioTotecnicoJovemUltimoRelatorio < ActiveRecord::Migration[5.1]
  def change
    rename_column :socioeduk_tecnico_jovem_ultimo_relatorios, :socioeduk_tecnico_jovem_id,  :tecnico_jovem_id
  end
end
