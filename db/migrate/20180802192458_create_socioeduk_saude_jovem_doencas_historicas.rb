class CreateSocioedukSaudeJovemDoencasHistoricas < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_saude_jovem_doencas_historicas do |t|
      t.references :socioeduk_saude_jovem, foreign_key: true, index: {:name => "saude_jovem"}
      t.references :socioeduk_cid, foreign_key: true, index: {:name => "cid"}
      t.string :diagnostico

      t.timestamps
    end
  end
end
