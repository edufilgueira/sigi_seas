class CreateUnidadeBlocoDormitorioCapacidades < ActiveRecord::Migration[5.1]
  def change
    create_table :unidade_bloco_dormitorio_capacidades do |t|
      t.references :unidade_bloco_dormitorio, foreign_key: true, index: {:name => "unidade_bloco_dormitorio_capacidade"}
      t.references :usuario, foreign_key: true
      t.integer :quantidade_alteracao
      t.string :responsavel

      t.timestamps
    end
  end
end
