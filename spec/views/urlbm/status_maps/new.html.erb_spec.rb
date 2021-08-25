require 'rails_helper'

RSpec.describe "urlbm/status_maps/new", type: :view do
  before(:each) do
    assign(:urlbm_status_map, Urlbm::StatusMap.new(
      :nome_status => "MyString"
    ))
  end

  it "renders new urlbm_status_map form" do
    render

    assert_select "form[action=?][method=?]", urlbm_status_maps_path, "post" do

      assert_select "input[name=?]", "urlbm_status_map[nome_status]"
    end
  end
end
