require 'rails_helper'

RSpec.describe "socioeduk/tipo_oficinas/index", type: :view do
  before(:each) do
    assign(:socioeduk_tipo_oficinas, [
      Socioeduk::TipoOficina.create!(
        :descricao => "Descricao"
      ),
      Socioeduk::TipoOficina.create!(
        :descricao => "Descricao"
      )
    ])
  end

  it "renders a list of socioeduk/tipo_oficinas" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
