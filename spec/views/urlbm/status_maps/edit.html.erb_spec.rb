require 'rails_helper'

RSpec.describe "urlbm/status_maps/edit", type: :view do
  before(:each) do
    @urlbm_status_map = assign(:urlbm_status_map, Urlbm::StatusMap.create!(
      :nome_status => "MyString"
    ))
  end

  it "renders the edit urlbm_status_map form" do
    render

    assert_select "form[action=?][method=?]", urlbm_status_map_path(@urlbm_status_map), "post" do

      assert_select "input[name=?]", "urlbm_status_map[nome_status]"
    end
  end
end
