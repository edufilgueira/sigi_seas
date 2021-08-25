class RenameSocioedukProcessoIdToProcessoNatureza < ActiveRecord::Migration[5.1]
  def change
    rename_column :socioeduk_processo_naturezas, :socioeduk_processo_id,  :processo_id
  end
end
