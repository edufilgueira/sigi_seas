class CreateSocioedukCondicaoFisicas < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_condicao_fisicas do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
