class CreateSocioedukConvivioFamiliares < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_convivio_familiares do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
