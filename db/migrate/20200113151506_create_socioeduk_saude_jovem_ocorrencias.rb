class CreateSocioedukSaudeJovemOcorrencias < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_saude_jovem_ocorrencias do |t|
      t.references :socioeduk_jovem_recepcao, foreign_key: true, index: { name: 'saude_jovem_ocorrencia_jovem_recepcao' }
      t.references :socioeduk_tipo_atendimento, foreign_key: true, index: { name: 'saude_jovem_ocorrencia_tipo_atendimento' }
      t.date :data
      t.text :observacao

      t.timestamps
    end
  end
end
