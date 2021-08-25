class CreateSocioedukJovemRecepcoes < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_jovem_recepcoes do |t|
      t.references :socioeduk_jovem, foreign_key: true
      t.boolean :antecedentes
      t.string :bo
      t.boolean :responsavel
      t.string :nome_responsavel
      t.string :telefone
      t.string :presenca_familiar_junto
      t.string :condutor_nome
      t.string :condutor_documento
      t.string :condutor_cargo
      t.string :datahora_apresentacao
      t.boolean :oficio
      t.boolean :documentos_pessoais
      t.boolean :decisao
      t.boolean :corpo_delito
      t.boolean :certidao_antecedente_criminal
      t.boolean :kit_vestuario

      t.timestamps
    end
  end
end
