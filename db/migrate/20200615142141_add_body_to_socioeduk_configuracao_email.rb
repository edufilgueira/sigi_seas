class AddBodyToSocioedukConfiguracaoEmail < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_configuracao_emails, :body, :text
  end
end
