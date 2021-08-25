require 'rails_helper'

RSpec.describe "urlbm/ato_infracionais/index", type: :view do
  before(:each) do
    assign(:urlbm_ato_infracionais, [
      Urlbm::AtoInfracional.create!(
        :tipo => "Tipo"
      ),
      Urlbm::AtoInfracional.create!(
        :tipo => "Tipo"
      )
    ])
  end

  it "renders a list of urlbm/ato_infracionais" do
    render
    assert_select "tr>td", :text => "Tipo".to_s, :count => 2
  end
end
