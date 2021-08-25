require 'rails_helper'

RSpec.describe "socioeduk/saude_jovem_vacinas/edit", type: :view do
  before(:each) do
    @socioeduk_saude_jovem_vacina = assign(:socioeduk_saude_jovem_vacina, Socioeduk::SaudeJovemVacina.create!(
      :socioeduk_saude_jovem => nil,
      :socioeduk_tipo_vacina => nil
    ))
  end

  xit "renders the edit socioeduk_saude_jovem_vacina form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_saude_jovem_vacina_path(@socioeduk_saude_jovem_vacina), "post" do

      assert_select "input[name=?]", "socioeduk_saude_jovem_vacina[socioeduk_saude_jovem_id]"

      assert_select "input[name=?]", "socioeduk_saude_jovem_vacina[socioeduk_tipo_vacina_id]"
    end
  end
end
