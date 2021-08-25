class AddDeletedAtToSocioedukNumeroProcesso < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_numero_processos, :deleted_at, :datetime
    add_index :socioeduk_numero_processos, :deleted_at
  end
end
