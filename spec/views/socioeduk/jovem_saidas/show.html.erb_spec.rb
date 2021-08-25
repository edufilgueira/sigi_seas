require 'rails_helper'

RSpec.describe "socioeduk/jovem_saidas/show", type: :view do
  before(:each) do
    @socioeduk_jovem_saida = assign(:socioeduk_jovem_saida, Socioeduk::JovemSaida.create!(
      :socioeduk_jovem => nil,
      :destino => "Destino",
      :observacao => "Observacao",
      :text => "Text"
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Destino/)
    expect(rendered).to match(/Observacao/)
    expect(rendered).to match(/Text/)
  end
end
