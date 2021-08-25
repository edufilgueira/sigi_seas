class AddDigitaisToJovem < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_jovens, :digitaldireita, :binary
    add_column :socioeduk_jovens, :digitalesquerda, :binary
  end
end
