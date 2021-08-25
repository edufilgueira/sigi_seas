class AddTipoPessoaToPessoa < ActiveRecord::Migration[5.1]
  def change
    add_reference :pessoas, :tipo_pessoa, foreign_key: true
  end
end
