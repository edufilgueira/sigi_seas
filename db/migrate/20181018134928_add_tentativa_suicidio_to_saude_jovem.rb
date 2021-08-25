class AddTentativaSuicidioToSaudeJovem < ActiveRecord::Migration[5.1]
  def change
    add_column :socioeduk_saude_jovens, :qtd_tentativas_suicidio, :integer
    add_column :socioeduk_saude_jovens, :datas_tentativas_tentativas_suicidio, :date
  end
end