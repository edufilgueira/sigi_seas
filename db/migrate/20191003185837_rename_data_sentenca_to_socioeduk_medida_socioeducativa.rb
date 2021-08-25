class RenameDataSentencaToSocioedukMedidaSocioeducativa < ActiveRecord::Migration[5.1]
  def change
    rename_column :socioeduk_medida_socioeducativas, :data_sentenca, :data_sentenca_conclusao
  end
end
