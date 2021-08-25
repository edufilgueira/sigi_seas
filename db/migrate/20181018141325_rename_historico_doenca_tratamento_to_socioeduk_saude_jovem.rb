class RenameHistoricoDoencaTratamentoToSocioedukSaudeJovem < ActiveRecord::Migration[5.1]
  def change
    remove_column :socioeduk_saude_jovens, :historico_doenca_tratamento, :string
    add_column :socioeduk_saude_jovens, :historico_doenca_tratamento, :boolean
  end
end