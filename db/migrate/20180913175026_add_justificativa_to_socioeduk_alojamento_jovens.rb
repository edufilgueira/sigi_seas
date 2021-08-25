class AddJustificativaToSocioedukAlojamentoJovens < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_alojamento_jovens, :justifica, :string
  end
end
