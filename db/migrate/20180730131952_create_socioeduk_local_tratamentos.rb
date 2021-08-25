class CreateSocioedukLocalTratamentos < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_local_tratamentos do |t|
      t.string :descricao
      t.boolean :status

      t.timestamps
    end
  end
end
