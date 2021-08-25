require 'rails_helper'

RSpec.describe "socioeduk/circunstancias/index", type: :view do
  before(:each) do
    assign(:socioeduk_circunstancias, [
      Socioeduk::Circunstancia.create!(
        :descricao => "Descricao"
      ),
      Socioeduk::Circunstancia.create!(
        :descricao => "Descricao"
      )
    ])
  end

  it "renders a list of socioeduk/circunstancias" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
