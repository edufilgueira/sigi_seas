class AddDeletedAtToSocioedukJovemRecepcao < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_jovem_recepcoes, :deleted_at, :datetime
  end
end
