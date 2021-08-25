class CreateSocioedukTecnicoJovemPlanoAtendimentos < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_tecnico_jovem_plano_atendimentos do |t|
      t.references :socioeduk_tecnico_jovem, foreign_key: true, index: {:name => "tecnico_jovem_plano_atendimento"}
      t.date :data_inclusao
      t.integer :unidade_socioeducativa_inclusao_id

      t.timestamps
    end
  end
end
