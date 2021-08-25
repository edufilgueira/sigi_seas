class CreateSocioedukSaudeJovensSubstanciasUtilizadas < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_saude_jovens_substancias_utilizadas do |t|
      t.references :socioeduk_saude_jovens, foreign_key: true, index: {:name => "saude_jovens_sub"}
      t.references :socioeduk_entorpecente, foreign_key: true, index: {:name => "entorpecente"}
      t.integer :iniciou_com_idade
      t.integer :parou_com_idade
      t.integer :frequencia
      t.references :socioeduk_tipo_auto_consideracao, foreign_key: true, index: {:name => "auto_consideracao"}
      t.boolean :realizou_tratamento
      t.references :socioeduk_tipo_tratamento, foreign_key: true, index: {:name => "tipo_tratamento"}

      t.timestamps
    end
  end
end
