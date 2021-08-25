class CreateSocioedukTecnicoJovemFamilias < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_tecnico_jovem_familias do |t|
      t.references :socioeduk_tecnico_jovem, foreign_key: true, index: {:name => "tecnico_jovem_familia"}
      t.string :nome
      t.references :socioeduk_escolaridade, foreign_key: true, index: {:name => "escolaridade_familia"}
      t.string :profissao
      t.references :socioeduk_tipo_parentesco, foreign_key: true, index: {:name => "tipo_parentesco_familia"}

      t.timestamps
    end
  end
end
