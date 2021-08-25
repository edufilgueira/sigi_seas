require 'rails_helper'

RSpec.describe "urlbm/status_maps/index", type: :view do
  before(:each) do
    assign(:urlbm_status_maps, [
      Urlbm::StatusMap.create!(
        :nome_status => "Nome Status"
      ),
      Urlbm::StatusMap.create!(
        :nome_status => "Nome Status"
      )
    ])
  end

  it "renders a list of urlbm/status_maps" do
    render
    assert_select "tr>td", :text => "Nome Status".to_s, :count => 2
  end
end
