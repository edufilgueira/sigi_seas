class CreateSocioedukVisitantes < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_visitantes do |t|
      t.string :nome
      t.references :socioeduk_jovem, foreign_key: true
      t.references :socioeduk_tipo_documento, foreign_key: true
      t.string :numero
      t.integer :uf_documento
      t.string :foto
      t.text :observação
      t.string :anexo

      t.timestamps
    end
  end
end
