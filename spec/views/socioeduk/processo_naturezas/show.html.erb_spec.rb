require 'rails_helper'

RSpec.describe "socioeduk/processo_naturezas/show", type: :view do
  before(:each) do
    @socioeduk_processo_natureza = assign(:socioeduk_processo_natureza, Socioeduk::ProcessoNatureza.create!(
      :socioeduk_processo => "",
      :tipo_natureza => "Tipo Natureza",
      :artigo => "Artigo"
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Tipo Natureza/)
    expect(rendered).to match(/Artigo/)
  end
end
