class CreateSocioedukComarcas < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_comarcas do |t|
      t.string :nome

      t.timestamps
    end
  end
end
