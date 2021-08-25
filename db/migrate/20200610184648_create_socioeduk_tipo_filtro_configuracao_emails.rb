class CreateSocioedukTipoFiltroConfiguracaoEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_tipo_filtro_configuracao_emails do |t|
      t.references :socioeduk_tipo_acao_configuracao_email, foreign_key: true, index: { name: 'socioeduk_tipo_acao_configuracao_email1' }
      t.string :nome
      t.string :descricao

      t.timestamps
    end
  end
end
