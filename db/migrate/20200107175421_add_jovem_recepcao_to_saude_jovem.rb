class AddJovemRecepcaoToSaudeJovem < ActiveRecord::Migration[5.1]
  def change
    add_reference :socioeduk_saude_jovens, :socioeduk_jovem_recepcao, foreign_key: true
  end
end
