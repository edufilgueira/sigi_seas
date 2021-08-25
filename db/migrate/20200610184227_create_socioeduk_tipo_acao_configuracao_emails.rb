class CreateSocioedukTipoAcaoConfiguracaoEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_tipo_acao_configuracao_emails do |t|
      t.string :nome
      t.string :descricao

      t.timestamps
    end
  end
end
