# frozen_string_literal: true

class RemoveMatriculaFromPessoa < ActiveRecord::Migration[5.1]
  def change
    remove_column :pessoas, :matricula, :string
  end
end
