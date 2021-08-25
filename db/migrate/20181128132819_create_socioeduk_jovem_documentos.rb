class CreateSocioedukJovemDocumentos < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_jovem_documentos do |t|
      t.references :socioeduk_jovem, foreign_key: true
      t.references :socioeduk_tipo_documento, foreign_key: true
      t.string :numero
      t.date :data_emissao
      t.integer :origem_documento
      t.integer :destino_documento

      t.timestamps
    end
  end
end
