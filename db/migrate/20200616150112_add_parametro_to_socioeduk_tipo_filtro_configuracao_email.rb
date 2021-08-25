class AddParametroToSocioedukTipoFiltroConfiguracaoEmail < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_tipo_filtro_configuracao_emails, :parametros, :text
  end
end
