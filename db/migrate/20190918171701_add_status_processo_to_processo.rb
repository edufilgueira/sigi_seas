class AddStatusProcessoToProcesso < ActiveRecord::Migration[5.1]
  def change
    add_reference :socioeduk_processos, :socioeduk_status_processo, foreign_key: true
  end
end
