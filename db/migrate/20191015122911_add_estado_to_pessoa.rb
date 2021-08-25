class AddEstadoToPessoa < ActiveRecord::Migration[5.1]
  def change
    add_reference :pessoas, :cidade, foreign_key: true
  end
end
