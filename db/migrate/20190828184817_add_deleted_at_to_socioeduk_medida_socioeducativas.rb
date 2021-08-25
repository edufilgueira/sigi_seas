class AddDeletedAtToSocioedukMedidaSocioeducativas < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_medida_socioeducativas, :deleted_at, :datetime
    add_index :socioeduk_medida_socioeducativas, :deleted_at
  end
end
