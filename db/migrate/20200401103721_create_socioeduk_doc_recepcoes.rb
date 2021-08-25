class CreateSocioedukDocRecepcoes < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_doc_recepcoes do |t|
      t.string :doc_recepcao

      t.timestamps
    end
  end
end
