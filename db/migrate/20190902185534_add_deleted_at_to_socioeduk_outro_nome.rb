class AddDeletedAtToSocioedukOutroNome < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_outro_nomes, :deleted_at, :datetime
    add_index :socioeduk_outro_nomes, :deleted_at
  end
end
