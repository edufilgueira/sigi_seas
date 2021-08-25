class AddPontoObrigatorioToPessoa < ActiveRecord::Migration[5.1]
  def change
    add_column :pessoas, :ponto_obrigatorio, :boolean
  end
end
