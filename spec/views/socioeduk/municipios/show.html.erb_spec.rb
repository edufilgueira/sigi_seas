require 'rails_helper'

RSpec.describe "socioeduk/municipios/show", type: :view do
  before(:each) do
    @socioeduk_municipio = assign(:socioeduk_municipio, Socioeduk::Municipio.create!(
      :descricao => "Descricao"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
  end
end
