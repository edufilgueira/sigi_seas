class AddComercaAndVaraToNumeroProcesso < ActiveRecord::Migration[5.1]
  def change
    add_reference :socioeduk_numero_processos, :socioeduk_comarca, foreign_key: true
    add_reference :socioeduk_numero_processos, :cidade, foreign_key: true
  end
end
