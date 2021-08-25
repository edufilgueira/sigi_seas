class CreateSocioedukTipoRetornos < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_tipo_retornos do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
