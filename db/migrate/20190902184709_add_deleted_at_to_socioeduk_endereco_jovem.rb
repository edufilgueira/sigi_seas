class AddDeletedAtToSocioedukEnderecoJovem < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_endereco_jovens, :deleted_at, :datetime
    add_index :socioeduk_endereco_jovens, :deleted_at
  end
end
