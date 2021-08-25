class CreateSocioedukProcessoAdvogados < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_processo_advogados do |t|
      t.references :socioeduk_processo, foreign_key: true
      t.string :nome
      t.string :numero
      t.integer :uf_oab
      t.boolean :defensor_publico
      t.references :unidade_socioeducativa, foreign_key: true

      t.timestamps
    end
  end
end
