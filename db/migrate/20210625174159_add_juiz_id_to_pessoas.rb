class AddJuizIdToPessoas < ActiveRecord::Migration[5.1]
  def change
    add_column :pessoas, :juiz_id, :integer
  end
end
