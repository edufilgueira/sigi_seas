require 'rails_helper'

RSpec.describe "socioeduk/circunstancias/new", type: :view do
  before(:each) do
    assign(:socioeduk_circunstancia, Socioeduk::Circunstancia.new(
      :descricao => "MyString"
    ))
  end

  it "renders new socioeduk_circunstancia form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_circunstancias_path, "post" do

      assert_select "input[name=?]", "socioeduk_circunstancia[descricao]"
    end
  end
end
