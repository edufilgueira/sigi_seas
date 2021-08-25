class AddJovemToSocioedukProcesso < ActiveRecord::Migration[5.1]
  def change
    add_reference :socioeduk_processos, :socioeduk_jovem_recepcao, foreign_key: true
  end
end
