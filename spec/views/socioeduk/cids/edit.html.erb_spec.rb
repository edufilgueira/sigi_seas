require 'rails_helper'

RSpec.describe "socioeduk/cids/edit", type: :view do
  before(:each) do
    @socioeduk_cid = assign(:socioeduk_cid, Socioeduk::Cid.create!(
      :descricao => "MyString"
    ))
  end

  it "renders the edit socioeduk_cid form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_cid_path(@socioeduk_cid), "post" do

      assert_select "input[name=?]", "socioeduk_cid[descricao]"
    end
  end
end
