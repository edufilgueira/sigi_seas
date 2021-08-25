class AddCidadeComarcaToSocioedukProcessos < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_processos, :cidade_comarca, :integer
  end
end
