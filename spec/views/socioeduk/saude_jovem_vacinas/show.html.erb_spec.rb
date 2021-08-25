require 'rails_helper'

RSpec.describe "socioeduk/saude_jovem_vacinas/show", type: :view do
  before(:each) do
    @socioeduk_saude_jovem_vacina = assign(:socioeduk_saude_jovem_vacina, Socioeduk::SaudeJovemVacina.create!(
      :socioeduk_saude_jovem => nil,
      :socioeduk_tipo_vacina => nil
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
