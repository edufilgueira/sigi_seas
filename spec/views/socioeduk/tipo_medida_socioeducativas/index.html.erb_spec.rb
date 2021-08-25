require 'rails_helper'

RSpec.describe "socioeduk/tipo_medida_socioeducativas/index", type: :view do
  before(:each) do
    assign(:socioeduk_tipo_medida_socioeducativas, [
      Socioeduk::TipoMedidaSocioeducativa.create!(
        :descricao => "Descricao"
      ),
      Socioeduk::TipoMedidaSocioeducativa.create!(
        :descricao => "Descricao"
      )
    ])
  end

  it "renders a list of socioeduk/tipo_medida_socioeducativas" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
