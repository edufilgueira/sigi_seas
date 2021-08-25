require 'rails_helper'

RSpec.describe "socioeduk/convivio_familiares/index", type: :view do
  before(:each) do
    assign(:socioeduk_convivio_familiares, [
      Socioeduk::ConvivioFamiliar.create!(
        :descricao => "Descricao"
      ),
      Socioeduk::ConvivioFamiliar.create!(
        :descricao => "Descricao"
      )
    ])
  end

  it "renders a list of socioeduk/convivio_familiares" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
