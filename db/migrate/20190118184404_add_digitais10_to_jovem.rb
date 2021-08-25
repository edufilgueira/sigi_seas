class AddDigitais10ToJovem < ActiveRecord::Migration[5.1]
  def change
    remove_column :socioeduk_jovens, :digitaldireita, :binary
    remove_column :socioeduk_jovens, :digitalesquerda, :binary
    add_column :socioeduk_jovens, :e1, :binary
    add_column :socioeduk_jovens, :e2, :binary
    add_column :socioeduk_jovens, :e3, :binary
    add_column :socioeduk_jovens, :e4, :binary
    add_column :socioeduk_jovens, :e5, :binary
    add_column :socioeduk_jovens, :d1, :binary
    add_column :socioeduk_jovens, :d2, :binary
    add_column :socioeduk_jovens, :d3, :binary
    add_column :socioeduk_jovens, :d4, :binary
    add_column :socioeduk_jovens, :d5, :binary
  end
end
