class CreateSocioedukPlanoIndividualAtendimentos < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_plano_individual_atendimentos do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
