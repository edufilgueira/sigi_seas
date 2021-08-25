class CreateSocioedukTecnicoJovemAnexos < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_tecnico_jovem_anexos do |t|
      t.references :socioeduk_tecnico_jovem, foreign_key: true, index: {:name => "tecnico_jovem_anexo"}
      t.date :data_inclusao
      t.references :unidade_socioeducativa, foreign_key: true,index: {:name => "unidade_socioeducativa_anexo"}

      t.timestamps
    end
  end
end
