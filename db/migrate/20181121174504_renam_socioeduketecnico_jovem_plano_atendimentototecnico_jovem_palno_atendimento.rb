class RenamSocioeduketecnicoJovemPlanoAtendimentototecnicoJovemPalnoAtendimento < ActiveRecord::Migration[5.1]
  def change
    rename_column :socioeduk_tecnico_jovem_plano_atendimentos, :socioeduk_tecnico_jovem_id,  :tecnico_jovem_id
  end
end
