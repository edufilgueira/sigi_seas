class AddSocioedukComarcaIdToComarcas < ActiveRecord::Migration[5.1]
  def change
    add_reference :pessoas, :socioeduk_comarca, foreign_key: true
  end
end
