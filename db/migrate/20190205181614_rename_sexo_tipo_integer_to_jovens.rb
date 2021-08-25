class RenameSexoTipoIntegerToJovens < ActiveRecord::Migration[5.1]
  def change
    change_column :socioeduk_jovens, :sexo, :string
  end
end
