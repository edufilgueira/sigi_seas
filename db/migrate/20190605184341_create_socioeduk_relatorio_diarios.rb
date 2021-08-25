class CreateSocioedukRelatorioDiarios < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_relatorio_diarios do |t|
      t.references :usuario, foreign_key: true
      t.references :unidade_socioeducativa, foreign_key: true
      t.integer :int_mas
      t.integer :int_fem
      t.integer :ip_mas
      t.integer :ip_fem
      t.integer :sl_mas
      t.integer :sl_fem
      t.integer :capacidade_nominal
      t.integer :capacidade_real
      t.integer :socioeducador_homem
      t.integer :socioeducador_mulher
      t.integer :capacidade_por_adolescente
      t.integer :evasao
      t.integer :fuga
      t.integer :descumprimento
      t.string :situacao_crise
      t.date :data
      t.text :resumo

      t.timestamps
    end
  end
end
