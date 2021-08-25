class AddSocioedukDocRecepcoesToSocioedukJovemRecepcoes < ActiveRecord::Migration[5.1]
  def change
    add_reference :socioeduk_jovem_recepcoes, :socioeduk_doc_recepcoes, foreign_key: true
  end
end
