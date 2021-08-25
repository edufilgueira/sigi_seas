class CreateSocioedukSolicitacaoVagas < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_solicitacao_vagas do |t|
      t.string :nome
      t.string :nome_mae
      t.string :sexo
      t.date :data_nascimento
      t.boolean :dependente_quimico
      t.string :rg
      t.string :orgao_expedidor
      t.string :cpf

      t.timestamps
    end
  end
end
