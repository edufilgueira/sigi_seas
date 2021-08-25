class AddRegiaoPaiToCidades < ActiveRecord::Migration[5.1]
  def change
    add_column :cidades, :regiao_pai, :integer
  end
end
