class AddNumeroProcessoProcessoNatureza < ActiveRecord::Migration[5.1]
  def change
    add_reference :socioeduk_processo_naturezas, :socioeduk_numero_processo, foreign_key: true, index: { name: 'numero_processo_natureza' }
  end
end
