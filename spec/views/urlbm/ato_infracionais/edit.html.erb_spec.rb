require 'rails_helper'

RSpec.describe "urlbm/ato_infracionais/edit", type: :view do
  before(:each) do
    @urlbm_ato_infracional = assign(:urlbm_ato_infracional, Urlbm::AtoInfracional.create!(
      :tipo => "MyString"
    ))
  end

  it "renders the edit urlbm_ato_infracional form" do
    render

    assert_select "form[action=?][method=?]", urlbm_ato_infracional_path(@urlbm_ato_infracional), "post" do

      assert_select "input[name=?]", "urlbm_ato_infracional[tipo]"
    end
  end
end
