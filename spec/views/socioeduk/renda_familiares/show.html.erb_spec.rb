require 'rails_helper'

RSpec.describe "socioeduk/renda_familiares/show", type: :view do
  before(:each) do
    @socioeduk_renda_familiar = assign(:socioeduk_renda_familiar, Socioeduk::RendaFamiliar.create!(
      :descricao => "Descricao"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
  end
end
