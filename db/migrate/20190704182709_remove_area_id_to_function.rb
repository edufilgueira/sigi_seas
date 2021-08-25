class RemoveAreaIdToFunction < ActiveRecord::Migration[5.1]
  def change
    remove_column :funcoes, :area_id, :integer
  end
end
