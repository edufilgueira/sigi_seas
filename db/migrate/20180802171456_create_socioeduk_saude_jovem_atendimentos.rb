class CreateSocioedukSaudeJovemAtendimentos < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_saude_jovem_atendimentos do |t|
      t.references :socioeduk_saude_jovem, foreign_key: true, index: {:name => "jovem_saude"}
      t.references :socioeduk_tipo_atendimento, foreign_key: true, index: {:name => "tipo_atendimento"}
      t.date :data_atendimento
      t.integer :local_atendimento
      t.string :outro_local_atendimento
      t.references :socioeduk_cid, foreign_key: true
      t.string :diagnostico
      t.string :nome_profissional
      t.string :descricao_atendimento

      t.timestamps
    end
  end
end
