require 'rails_helper'

RSpec.describe "socioeduk/comarcas/show", type: :view do
  before(:each) do
    @socioeduk_comarca = assign(:socioeduk_comarca, Socioeduk::Comarca.create!(
      :nome => "Nome"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
  end
end
