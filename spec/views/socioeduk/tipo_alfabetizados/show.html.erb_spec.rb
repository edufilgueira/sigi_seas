require 'rails_helper'

RSpec.describe "socioeduk/tipo_alfabetizados/show", type: :view do
  before(:each) do
    @socioeduk_tipo_alfabetizado = assign(:socioeduk_tipo_alfabetizado, Socioeduk::TipoAlfabetizado.create!(
      :descricao => "Descricao"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
  end
end
