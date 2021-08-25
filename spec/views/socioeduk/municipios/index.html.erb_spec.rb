require 'rails_helper'

RSpec.describe "socioeduk/municipios/index", type: :view do
  before(:each) do
    assign(:socioeduk_municipios, [
      Socioeduk::Municipio.create!(
        :descricao => "Descricao"
      ),
      Socioeduk::Municipio.create!(
        :descricao => "Descricao"
      )
    ])
  end

  it "renders a list of socioeduk/municipios" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
