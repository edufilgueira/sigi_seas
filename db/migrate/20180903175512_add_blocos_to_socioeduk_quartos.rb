class AddBlocosToSocioedukQuartos < ActiveRecord::Migration[5.1]
  def change
    add_reference :socioeduk_quartos, :socioeduk_bloco, foreign_key: true
  end
end
