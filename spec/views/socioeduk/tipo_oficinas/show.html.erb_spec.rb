require 'rails_helper'

RSpec.describe "socioeduk/tipo_oficinas/show", type: :view do
  before(:each) do
    @socioeduk_tipo_oficina = assign(:socioeduk_tipo_oficina, Socioeduk::TipoOficina.create!(
      :descricao => "Descricao"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
  end
end
