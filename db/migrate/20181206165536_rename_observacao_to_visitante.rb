class RenameObservacaoToVisitante < ActiveRecord::Migration[5.1]
  def change
    rename_column :socioeduk_visitantes, :observação,  :observacao
  end
end
