class RemoveUnidadeSocioEducativaFromQuartos < ActiveRecord::Migration[5.1]
  def change
    remove_reference :socioeduk_quartos, :unidade_socioeducativa, foreign_key: true
  end
end
