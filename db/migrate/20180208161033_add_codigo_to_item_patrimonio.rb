# frozen_string_literal: true

class AddCodigoToItemPatrimonio < ActiveRecord::Migration[5.1]
  def change
    add_column :item_patrimonios, :codigo, :string
  end
end
