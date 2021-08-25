class AddSiglaToArtigoInfracao < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_artigo_infracoes, :nome, :string
  end
end