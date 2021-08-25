require 'rails_helper'

RSpec.describe "socioeduk/cids/index", type: :view do
  before(:each) do
    assign(:socioeduk_cids, [
      Socioeduk::Cid.create!(
        :descricao => "Descricao"
      ),
      Socioeduk::Cid.create!(
        :descricao => "Descricao"
      )
    ])
  end

  it "renders a list of socioeduk/cids" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
