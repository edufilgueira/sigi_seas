require 'rails_helper'

RSpec.describe "unidade_socioeducativa_areas/new", type: :view do
  before(:each) do
    assign(:unidade_socioeducativa_area, UnidadeSocioeducativaArea.new(
      :unidade_socioeducativa => nil,
      :area => nil
    ))
  end

  it "renders new unidade_socioeducativa_area form" do
    render

    assert_select "form[action=?][method=?]", unidade_socioeducativa_areas_path, "post" do

      assert_select "input[name=?]", "unidade_socioeducativa_area[unidade_socioeducativa_id]"

      assert_select "input[name=?]", "unidade_socioeducativa_area[area_id]"
    end
  end
end
