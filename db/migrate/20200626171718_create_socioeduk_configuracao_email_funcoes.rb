class CreateSocioedukConfiguracaoEmailFuncoes < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_configuracao_email_funcoes do |t|
      t.references :socioeduk_configuracao_email, foreign_key: true, index: { name: 'configuracao_email_funcoes' }
      t.references :funcao, foreign_key: true

      t.timestamps
    end
  end
end
