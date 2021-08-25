class AddDataSentencaToSocioedukMedidaSocioeducativa < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_medida_socioeducativas, :data_sentenca, :date
  end
end
