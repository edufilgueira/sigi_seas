class CreateSocioedukCids < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_cids do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
