class CreateSocioedukSaudeJovemSaudeClinicas < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_saude_jovem_saude_clinicas do |t|
      t.references :socioeduk_saude_jovem, foreign_key: true, index: {:name => "saude_jovem_clineca"}
      t.boolean :odontologico_clinico
      t.references :socioeduk_cid, foreign_key: true, index: {:name => "cid_clinica"}
      t.string :diagnostico
      t.references :socioeduk_local_tratamento, foreign_key: true, index: {:name => "local_tratamento_clinica"}
      t.string :outro_local_tratamento

      t.timestamps
    end
  end
end
