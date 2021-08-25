class AddUtilizarExedenteVagaToSocioedukAlojamentoJovens < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_alojamento_jovens, :utilizar_exedente_vaga, :boolean
  end
end
