class CreateSocioedukNumeroProcessos < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_numero_processos do |t|
      t.references :socioeduk_processo, foreign_key: true
      t.string :numero

      t.timestamps
    end
  end
end
