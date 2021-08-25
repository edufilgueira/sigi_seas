class CreateSocioedukTipoMedicamnetoControlados < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_tipo_medicamento_controlados do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
