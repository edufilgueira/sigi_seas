class CreateUnidadeBlocoDormitorios < ActiveRecord::Migration[5.1]
  def change
    create_table :unidade_bloco_dormitorios do |t|
      t.references :unidade_socioeducativa_bloco, foreign_key: true, index: {:name => "unidade_socioeducativa_bloco_dormitorios"}
      t.string :descricao
      t.integer :capacidade_base

      t.timestamps
    end
  end
end
