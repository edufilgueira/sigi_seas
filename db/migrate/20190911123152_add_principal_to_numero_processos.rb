class AddPrincipalToNumeroProcessos < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_numero_processos, :principal, :boolean
    add_column :socioeduk_numero_processos, :status, :boolean
  end
end
