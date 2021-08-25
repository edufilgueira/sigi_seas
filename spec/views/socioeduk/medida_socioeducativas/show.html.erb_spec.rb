require 'rails_helper'

RSpec.describe "socioeduk/medida_socioeducativas/show", type: :view do
  before(:each) do
    @socioeduk_medida_socioeducativa = assign(:socioeduk_medida_socioeducativa, Socioeduk::MedidaSocioeducativa.create!(
      :socioeduk_processo => nil,
      :socioeduk_tipo_medida_socioeducativa => nil,
      :socioeduk_situacao_cumprimento => nil,
      :socioeduk_circunstancia => nil,
      :periodo_dias => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
