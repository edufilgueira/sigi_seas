require 'rails_helper'

RSpec.describe "socioeduk/escolaridades/new", type: :view do
  before(:each) do
    assign(:socioeduk_escolaridade, Socioeduk::Escolaridade.new(
      :descricao => "MyString"
    ))
  end

  it "renders new socioeduk_escolaridade form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_escolaridades_path, "post" do

      assert_select "input[name=?]", "socioeduk_escolaridade[descricao]"
    end
  end
end
