require 'rails_helper'

RSpec.describe "socioeduk/condicao_fisicas/new", type: :view do
  before(:each) do
    assign(:socioeduk_condicao_fisica, Socioeduk::CondicaoFisica.new(
      :descricao => "MyString"
    ))
  end

  it "renders new socioeduk_condicao_fisica form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_condicao_fisicas_path, "post" do

      assert_select "input[name=?]", "socioeduk_condicao_fisica[descricao]"
    end
  end
end
