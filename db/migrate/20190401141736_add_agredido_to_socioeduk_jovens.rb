class AddAgredidoToSocioedukJovens < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_jovens, :agredido, :text
  end
end
