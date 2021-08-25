require 'rails_helper'

RSpec.describe "socioeduk/saude_jovem_doencas_historicas/show", type: :view do
  before(:each) do
    @socioeduk_saude_jovem_doencas_historica = assign(:socioeduk_saude_jovem_doencas_historica, Socioeduk::SaudeJovemDoencasHistorica.create!(
      :socioeduk_saude_jovem => nil,
      :socioeduk_cid => nil,
      :diagnostico => "Diagnostico"
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Diagnostico/)
  end
end
