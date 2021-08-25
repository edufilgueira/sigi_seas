class CreateSocioedukConfiguracaoEmailPessoas < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_configuracao_email_pessoas do |t|
      t.references :socioeduk_configuracao_email, foreign_key: true, index: { name: 'onfiguracao_email_pessoas' }
      t.string :identificacao
      t.string :email

      t.timestamps
    end
  end
end
