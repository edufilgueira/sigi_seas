class CreateSocioedukGestaoVagas < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_gestao_vagas do |t|
      t.references :socioeduk_jovem, foreign_key: true
      t.integer :de_unidade_socioeducativa_id
      t.integer :para_unidade_socioeducativa_id
      t.references :usuario, foreign_key: true
      t.string :status
      t.boolean :ativo, default: true

      t.timestamps
    end
  end
end
