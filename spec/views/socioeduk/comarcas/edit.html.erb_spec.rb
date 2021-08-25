require 'rails_helper'

RSpec.describe "socioeduk/comarcas/edit", type: :view do
  before(:each) do
    @socioeduk_comarca = assign(:socioeduk_comarca, Socioeduk::Comarca.create!(
      :nome => "MyString"
    ))
  end

  it "renders the edit socioeduk_comarca form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_comarca_path(@socioeduk_comarca), "post" do

      assert_select "input[name=?]", "socioeduk_comarca[nome]"
    end
  end
end
