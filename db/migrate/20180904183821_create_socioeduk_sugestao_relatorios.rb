class CreateSocioedukSugestaoRelatorios < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_sugestao_relatorios do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
