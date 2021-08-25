class CreateSocioedukSaudeJovensTipoMedicamentoControlados < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_saude_jovens_tipo_medicamento_controlados do |t|
      t.references :socioeduk_saude_jovens, foreign_key: true, index: {:name => "saude_jovens_tipmedic"}
      t.references :socioeduk_tipo_medicamento_controlado, foreign_key: true, index: {:name => "tipo_medicamento_controlado"}

      t.timestamps
    end
  end
end
