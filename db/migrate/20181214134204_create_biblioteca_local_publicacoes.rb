class CreateBibliotecaLocalPublicacoes < ActiveRecord::Migration[5.1]
  def change
    create_table :biblioteca_local_publicacoes do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
