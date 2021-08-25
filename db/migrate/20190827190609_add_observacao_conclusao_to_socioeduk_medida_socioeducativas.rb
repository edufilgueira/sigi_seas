class AddObservacaoConclusaoToSocioedukMedidaSocioeducativas < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_medida_socioeducativas, :observacao_conclusao, :text
  end
end
