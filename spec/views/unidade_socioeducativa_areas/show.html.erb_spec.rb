require 'rails_helper'

RSpec.describe "unidade_socioeducativa_areas/show", type: :view do
  before(:each) do
    @unidade_socioeducativa_area = assign(:unidade_socioeducativa_area, UnidadeSocioeducativaArea.create!(
      :unidade_socioeducativa => nil,
      :area => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
