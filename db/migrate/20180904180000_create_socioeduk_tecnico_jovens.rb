class CreateSocioedukTecnicoJovens < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_tecnico_jovens do |t|
      t.references :socioeduk_jovem, foreign_key: true
      t.boolean :tem_filhos
      t.integer :quantos_filhos
      t.references :socioeduk_convivio_familiar, foreign_key: true, index: {:name => "convivio_familiar_tecnico_jovem"}
      t.string :codigo_familiar
      t.string :cnis
      t.boolean :programas_sociais
      t.references :socioeduk_renda_familiar, foreign_key: true
      t.references :socioeduk_composicao_familiar, foreign_key: true, index: {:name => "composicao_familiar_tecnico_jovem"}
      t.references :socioeduk_plano_individual_atendimento, foreign_key: true, index: {:name => "plano_individual_atendimento_tecnico_jovem"}
      t.string :nome_tecnico
      t.string :profissional_referencia

      t.timestamps
    end
  end
end
