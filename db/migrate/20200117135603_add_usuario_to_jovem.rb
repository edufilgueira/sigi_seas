class AddUsuarioToJovem < ActiveRecord::Migration[5.1]
  def change
    add_reference :socioeduk_jovens, :usuario, foreign_key: true
  end
end
