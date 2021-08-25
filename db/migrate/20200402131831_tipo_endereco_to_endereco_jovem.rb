class TipoEnderecoToEnderecoJovem < ActiveRecord::Migration[5.1]
  def change
    add_reference :socioeduk_endereco_jovens, :socioeduk_tipo_enderecos, foreign_key: true
  end
end
