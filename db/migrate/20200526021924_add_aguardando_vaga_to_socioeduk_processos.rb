class AddAguardandoVagaToSocioedukProcessos < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_processos, :aguardando_vaga, :boolean
  end
end
