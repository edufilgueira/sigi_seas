class CreateSocioedukProgramaSociais < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_programa_sociais do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
