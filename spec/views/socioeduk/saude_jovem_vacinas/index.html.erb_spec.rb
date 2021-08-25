require 'rails_helper'

RSpec.describe "socioeduk/saude_jovem_vacinas/index", type: :view do
  before(:each) do
    assign(:socioeduk_saude_jovem_vacinas, [
      Socioeduk::SaudeJovemVacina.create!(
        :socioeduk_saude_jovem => nil,
        :socioeduk_tipo_vacina => nil
      ),
      Socioeduk::SaudeJovemVacina.create!(
        :socioeduk_saude_jovem => nil,
        :socioeduk_tipo_vacina => nil
      )
    ])
  end

  xit "renders a list of socioeduk/saude_jovem_vacinas" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
