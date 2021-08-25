class AddPaiIdToArtigoInfracao < ActiveRecord::Migration[5.1]
  def change
    add_column  :socioeduk_artigo_infracoes, :pai_id, :integer
  end
end
