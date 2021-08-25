class CreateSocioedukComposicaoFamiliares < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_composicao_familiares do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
