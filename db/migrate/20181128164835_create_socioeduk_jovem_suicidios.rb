class CreateSocioedukJovemSuicidios < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_jovem_suicidios do |t|
      t.references :socioeduk_jovem, foreign_key: true
      t.references :unidade_socioeducativa, foreign_key: true
      t.integer :idade
      t.string :filiacao
      t.date :data_entrada_unidade
      t.string :municipio
      t.datetime :data_evento
      t.string :dia_semana
      t.string :metodo
      t.boolean :foi_planejado
      t.text :descricao_planejamento
      t.boolean :ouve_aviso
      t.text :descricao_aviso
      t.boolean :deixou_mensagem
      t.text :descricao_mensagem
      t.boolean :estava_acompanhado
      t.text :descricao_acompanhamento
      t.string :onde_ocorreu
      t.string :tempo_socorro_suicidio
      t.string :quem_socorreu
      t.text :procedimento_socorro
      t.boolean :depressao
      t.boolean :apatia
      t.boolean :insonia
      t.boolean :drogas
      t.boolean :impulsividade
      t.boolean :relacionamento
      t.boolean :isolamento
      t.boolean :outros
      t.text :descrever_outros

      t.timestamps
    end
  end
end
