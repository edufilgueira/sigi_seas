class AddEstuproVulneravelToProcessoNatureza < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_processo_naturezas, :estupro_vulneravel, :boolean
  end
end
