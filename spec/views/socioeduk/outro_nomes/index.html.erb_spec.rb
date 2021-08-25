require 'rails_helper'

RSpec.describe "socioeduk/outro_nomes/index", type: :view do
  before(:each) do
    assign(:socioeduk_outro_nomes, [
      Socioeduk::OutroNome.create!(
        :socioeduk_jovem => nil,
        :descricao => "Descricao"
      ),
      Socioeduk::OutroNome.create!(
        :socioeduk_jovem => nil,
        :descricao => "Descricao"
      )
    ])
  end

  xit "renders a list of socioeduk/outro_nomes" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
