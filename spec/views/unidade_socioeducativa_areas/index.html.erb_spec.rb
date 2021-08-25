require 'rails_helper'

RSpec.describe "unidade_socioeducativa_areas/index", type: :view do
  before(:each) do
    assign(:unidade_socioeducativa_areas, [
      UnidadeSocioeducativaArea.create!(
        :unidade_socioeducativa => nil,
        :area => nil
      ),
      UnidadeSocioeducativaArea.create!(
        :unidade_socioeducativa => nil,
        :area => nil
      )
    ])
  end

  it "renders a list of unidade_socioeducativa_areas" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
