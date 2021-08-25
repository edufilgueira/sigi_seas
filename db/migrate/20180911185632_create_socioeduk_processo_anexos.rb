class CreateSocioedukProcessoAnexos < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_processo_anexos do |t|
      t.references :socioeduk_processo, foreign_key: true

      t.timestamps
    end
  end
end
