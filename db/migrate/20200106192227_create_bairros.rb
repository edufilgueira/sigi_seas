class CreateBairros < ActiveRecord::Migration[5.1]
  def change
    create_table :bairros do |t|
      t.references :cidade
      t.string :nome

      t.timestamps
    end
  end
end
