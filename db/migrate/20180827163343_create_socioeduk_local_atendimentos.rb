class CreateSocioedukLocalAtendimentos < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_local_atendimentos do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
