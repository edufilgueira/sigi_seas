class CreateSocioedukOutroNomes < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_outro_nomes do |t|
      t.references :socioeduk_jovem, foreign_key: true
      t.string :descricao

      t.timestamps
    end
  end
end
