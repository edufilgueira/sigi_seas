class CreateSocioedukAlojamentoJovens < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_alojamento_jovens do |t|
      t.references :socioeduk_jovem, foreign_key: true
      t.references :unidade_socioeducativa, foreign_key: true
      t.references :socioeduk_bloco, foreign_key: true
      t.references :socioeduk_quarto, foreign_key: true
      t.string :tamanho_roupa
      t.string :tamanho_cacaldo
      t.string :numero_kit

      t.timestamps
    end
  end
end
