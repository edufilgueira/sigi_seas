class AddAreaIdToRecursoshumanosVinculos < ActiveRecord::Migration[5.1]
  def change
    add_reference :recursoshumanos_vinculos, :unidade_socioeducativa_area, foreign_key: true, index: {:name => "unidade_socioeducativa_area_Vinculo"}
  end
end
