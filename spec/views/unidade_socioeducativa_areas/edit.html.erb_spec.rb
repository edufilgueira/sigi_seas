require 'rails_helper'

RSpec.describe "unidade_socioeducativa_areas/edit", type: :view do
  before(:each) do
    @unidade_socioeducativa_area = assign(:unidade_socioeducativa_area, UnidadeSocioeducativaArea.create!(
      :unidade_socioeducativa => nil,
      :area => nil
    ))
  end

  it "renders the edit unidade_socioeducativa_area form" do
    render

    assert_select "form[action=?][method=?]", unidade_socioeducativa_area_path(@unidade_socioeducativa_area), "post" do

      assert_select "input[name=?]", "unidade_socioeducativa_area[unidade_socioeducativa_id]"

      assert_select "input[name=?]", "unidade_socioeducativa_area[area_id]"
    end
  end
end
