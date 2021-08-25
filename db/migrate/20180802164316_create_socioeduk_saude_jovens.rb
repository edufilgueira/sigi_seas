class CreateSocioedukSaudeJovens < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_saude_jovens do |t|
      t.references :socioeduk_jovem, foreign_key: true
      t.string :cartao_sus
      t.float :altura_estimada
      t.float :peso_estimado
      t.references :socioeduk_condicao_fisica, foreign_key: true
      t.boolean :gravida
      t.date :data_ultima_menstruacao
      t.date :data_provavel_parto
      t.integer :qtd_gestacoes
      t.integer :qtd_parto_normal
      t.integer :qtd_cesariana
      t.integer :qtd_aborto
      t.integer :qtd_filhos_vivos
      t.integer :filhos_deficiente_fisico
      t.boolean :metodo_contraceptivo
      t.boolean :usou_drogas
      t.boolean :historico_tratamento_psiquiatrico
      t.integer :local_tratamento_psiquiatrico_id
      t.string :outro_local_psiquiatrico
      t.date :tempo_psiquiatrico
      t.boolean :hipotese_diagnostica_transtorno_mental
      t.integer :local_tratamento_transtorno_mental_id
      t.string :outro_local_transtorno_mental
      t.date :tempo_transtorno_mental
      t.boolean :medicamento_controlado
      t.boolean :tentativa_suicidio
      t.boolean :tentativa_suicidio_familiar
      t.boolean :doenca_mental_familiar
      t.integer :cid_mental_id
      t.string :diagnostico_mental
      t.string :historico_doenca_tratamento
      t.boolean :medicamento_doenca_cronica
      t.boolean :uso_protese
      t.boolean :uso_ortese
      t.boolean :fez_cirurgia
      t.boolean :tem_fratura
      t.boolean :tem_alergia_alimentar
      t.string :descricao_alergia
      t.boolean :tem_alergia_medicamentosa
      t.string :descricao_alergia_medicamentosa
      t.string :outras_vacinas_recebidas
      t.string :outros_exames

      t.timestamps
    end
  end
end
