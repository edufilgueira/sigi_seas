require 'rails_helper'

RSpec.describe "socioeduk/convivio_familiares/show", type: :view do
  before(:each) do
    @socioeduk_convivio_familiar = assign(:socioeduk_convivio_familiar, Socioeduk::ConvivioFamiliar.create!(
      :descricao => "Descricao"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
  end
end
