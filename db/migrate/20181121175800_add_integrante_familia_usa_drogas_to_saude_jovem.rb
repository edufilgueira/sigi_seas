class AddIntegranteFamiliaUsaDrogasToSaudeJovem < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_saude_jovens, :integrante_familia_usa_drogas, :boolean
  end
end
