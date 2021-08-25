class CreateSocioedukTipoConclusaoMedidaSocioeducativas < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_tipo_conclusao_medida_socioeducativas do |t|
      t.string :descricao
      t.boolean :ativo, default: true

      t.timestamps
    end
  end
end
