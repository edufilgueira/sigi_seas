require 'rails_helper'

RSpec.describe "urlbm/status_maps/show", type: :view do
  before(:each) do
    @urlbm_status_map = assign(:urlbm_status_map, Urlbm::StatusMap.create!(
      :nome_status => "Nome Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome Status/)
  end
end
