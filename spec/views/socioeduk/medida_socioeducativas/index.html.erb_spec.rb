require 'rails_helper'

RSpec.describe "socioeduk/medida_socioeducativas/index", type: :view do
  before(:each) do
    assign(:socioeduk_medida_socioeducativas, [
      Socioeduk::MedidaSocioeducativa.create!(
        :socioeduk_processo => nil,
        :socioeduk_tipo_medida_socioeducativa => nil,
        :socioeduk_situacao_cumprimento => nil,
        :socioeduk_circunstancia => nil,
        :periodo_dias => 2
      ),
      Socioeduk::MedidaSocioeducativa.create!(
        :socioeduk_processo => nil,
        :socioeduk_tipo_medida_socioeducativa => nil,
        :socioeduk_situacao_cumprimento => nil,
        :socioeduk_circunstancia => nil,
        :periodo_dias => 2
      )
    ])
  end

  it "renders a list of socioeduk/medida_socioeducativas" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
