require 'rails_helper'

RSpec.describe "socioeduk/cids/show", type: :view do
  before(:each) do
    @socioeduk_cid = assign(:socioeduk_cid, Socioeduk::Cid.create!(
      :descricao => "Descricao"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
  end
end
