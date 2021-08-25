class CreateUrlbmMapas < ActiveRecord::Migration[5.1]
  def change
    create_table :urlbm_mapas do |t|
      t.string :num_processo
      t.string :responsavel
      t.string :telefone
      t.string :data_ocorrencia
      t.string :data_admissao
      t.string :data_nascimento
      t.string :data_judicial
      t.boolean :reincidente
      t.string :idade
      t.string :bo_mapa
      t.string :obs
      t.references :socioeduk_jovem_recepcao, foreign_key: true
      t.references :socioeduk_jovens, foreign_key: true
      t.references :urlbm_ato_infracional, foreign_key: true
      t.references :cidade, foreign_key: true

      t.timestamps
    end
  end
end
