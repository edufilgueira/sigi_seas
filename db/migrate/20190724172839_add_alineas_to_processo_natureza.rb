class AddAlineasToProcessoNatureza < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_processo_naturezas, :alineas, :string
  end
end
