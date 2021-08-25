class AddPonderacaoToSocioedukArtigoInfracoes < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_artigo_infracoes, :ponderacao, :integer, :default => 1
  end
end
