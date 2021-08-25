class RemoveSocioedukComarcaToSocioedukProcessos < ActiveRecord::Migration[5.1]
  def change
    remove_column :socioeduk_processos, :socioeduk_comarca_id
  end
end
