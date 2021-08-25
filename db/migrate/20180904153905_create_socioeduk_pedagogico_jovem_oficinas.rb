class CreateSocioedukPedagogicoJovemOficinas < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_pedagogico_jovem_oficinas do |t|
      t.references :socioeduk_pedagogico_jovem, foreign_key: true, index: {:name => "pedagogico_jovem_oficina"}
      t.references :socioeduk_tipo_oficina, foreign_key: true, index: {:name => "tipo_oficina_oficina"}
      t.string :nome
      t.date :data_inicia
      t.date :data_fim
      t.string :carga_horaria

      t.timestamps
    end
  end
end
