class CreateSocioedukProcessoNaturezas < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_processo_naturezas do |t|
      t.references :socioeduk_processo
      t.string :tipo_natureza
      t.string :artigo

      t.timestamps
    end
  end
end
