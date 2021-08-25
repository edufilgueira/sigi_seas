class CreateSocioedukSaudeJovensMetodosContraceptivos < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_saude_jovens_metodos_contraceptivos do |t|
      t.references :socioeduk_saude_jovem, foreign_key: true, index: {:name => "saude_jovem_contra"}
      t.references :socioeduk_metodo_contraceptivo, foreign_key: true, index: {:name => "metodo_contraceptivo"}
      t.string :outros_metodos

      t.timestamps
    end
  end
end
