require 'rails_helper'

RSpec.describe "socioeduk/comarcas/index", type: :view do
  before(:each) do
    assign(:socioeduk_comarcas, [
      Socioeduk::Comarca.create!(
        :nome => "Nome"
      ),
      Socioeduk::Comarca.create!(
        :nome => "Nome"
      )
    ])
  end

  it "renders a list of socioeduk/comarcas" do
    render
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
  end
end
