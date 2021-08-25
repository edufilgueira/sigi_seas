require 'rails_helper'

RSpec.describe "urlbm/ato_infracionais/new", type: :view do
  before(:each) do
    assign(:urlbm_ato_infracional, Urlbm::AtoInfracional.new(
      :tipo => "MyString"
    ))
  end

  it "renders new urlbm_ato_infracional form" do
    render

    assert_select "form[action=?][method=?]", urlbm_ato_infracionais_path, "post" do

      assert_select "input[name=?]", "urlbm_ato_infracional[tipo]"
    end
  end
end
