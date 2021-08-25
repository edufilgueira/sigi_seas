class CreateUnidadeSocioeducativaBlocos < ActiveRecord::Migration[5.1]
  def change
    create_table :unidade_socioeducativa_blocos do |t|
      t.string :descricao
      t.references :unidade_socioeducativa, foreign_key: true, index: {:name => "unidade_socioeducativa_bloco"}

      t.timestamps
    end
  end
end
