class CreateBibliotecaLocais < ActiveRecord::Migration[5.1]
  def change
    create_table :biblioteca_locais do |t|
      t.string :nome

      t.timestamps
    end
  end
end
