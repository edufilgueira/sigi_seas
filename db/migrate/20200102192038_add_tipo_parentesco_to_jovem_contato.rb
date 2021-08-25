class AddTipoParentescoToJovemContato < ActiveRecord::Migration[5.1]
  def change
    add_reference :socioeduk_jovem_contatos, :socioeduk_tipo_parentescos, foreign_key: true
  end
end
