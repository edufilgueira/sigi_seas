require 'rails_helper'

RSpec.describe "socioeduk/tipo_medida_socioeducativas/show", type: :view do
  before(:each) do
    @socioeduk_tipo_medida_socioeducativa = assign(:socioeduk_tipo_medida_socioeducativa, Socioeduk::TipoMedidaSocioeducativa.create!(
      :descricao => "Descricao"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
  end
end
