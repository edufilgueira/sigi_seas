require 'rails_helper'

RSpec.describe "socioeduk/saude_jovem_saude_clinicas/show", type: :view do
  before(:each) do
    @socioeduk_saude_jovem_saude_clinica = assign(:socioeduk_saude_jovem_saude_clinica, Socioeduk::SaudeJovemSaudeClinica.create!(
      :socioeduk_saude_jovem => nil,
      :odontologico_clinico => false,
      :socioeduk_cid => nil,
      :diagnostico => "Diagnostico",
      :socioeduk_local_tratamento => nil,
      :outro_local_tratamento => "Outro Local Tratamento"
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Diagnostico/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Outro Local Tratamento/)
  end
end
