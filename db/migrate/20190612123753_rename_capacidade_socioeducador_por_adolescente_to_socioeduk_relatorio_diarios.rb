class RenameCapacidadeSocioeducadorPorAdolescenteToSocioedukRelatorioDiarios < ActiveRecord::Migration[5.1]
  def change
    rename_column :socioeduk_relatorio_diarios, :capacidade_socioeducador_por_adolescente, :capacidade_por_adolescente_percentual
  end
end
