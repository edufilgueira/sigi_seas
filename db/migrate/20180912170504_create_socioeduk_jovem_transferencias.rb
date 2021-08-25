class CreateSocioedukJovemTransferencias < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_jovem_transferencias do |t|
      t.references :socioeduk_jovem, foreign_key: true
      t.references :unidade_socioeducativa, foreign_key: true, index: {:name => "unidade_socioeducativa_jovem_transferencias"}

      t.timestamps
    end
  end
end
