class AddBairrosToEnderecoJovem < ActiveRecord::Migration[5.1]
  def change
    add_reference :socioeduk_endereco_jovens, :bairro, foreign_key: true
  end
end
