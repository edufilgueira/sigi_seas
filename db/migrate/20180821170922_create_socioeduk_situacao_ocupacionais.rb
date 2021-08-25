class CreateSocioedukSituacaoOcupacionais < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_situacao_ocupacionais do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
