class CreateSocioedukSituacaoCumprimentos < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_situacao_cumprimentos do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
