require 'rails_helper'

RSpec.describe "socioeduk/cids/new", type: :view do
  before(:each) do
    assign(:socioeduk_cid, Socioeduk::Cid.new(
      :descricao => "MyString"
    ))
  end

  it "renders new socioeduk_cid form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_cids_path, "post" do

      assert_select "input[name=?]", "socioeduk_cid[descricao]"
    end
  end
end
