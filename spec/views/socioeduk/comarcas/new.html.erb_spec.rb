require 'rails_helper'

RSpec.describe "socioeduk/comarcas/new", type: :view do
  before(:each) do
    assign(:socioeduk_comarca, Socioeduk::Comarca.new(
      :nome => "MyString"
    ))
  end

  it "renders new socioeduk_comarca form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_comarcas_path, "post" do

      assert_select "input[name=?]", "socioeduk_comarca[nome]"
    end
  end
end
