class RemoveAddUfDocumentoToVisitantes < ActiveRecord::Migration[5.1]
  def change
    remove_column :socioeduk_visitantes, :uf_documento, :integer
    add_column :socioeduk_visitantes, :uf_documento, :string
  end
end
