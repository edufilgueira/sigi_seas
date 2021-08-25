class CreateSocioedukConfiguracaoEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_configuracao_emails do |t|
      t.references :socioeduk_tipo_acao_configuracao_email, foreign_key: true, index: { name: 'tipo_acao_configuracao_email' }
      t.references :socioeduk_tipo_filtro_configuracao_email, foreign_key: true, index: { name: 'socioeduk_tipo_filtro_configuracao_email' }
      t.string :descricao
      t.string :valor_descricao
      t.string :valor

      t.timestamps
    end
  end
end
