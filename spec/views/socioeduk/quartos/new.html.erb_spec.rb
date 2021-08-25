require 'rails_helper'

RSpec.describe "socioeduk/quartos/new", type: :view do
  before(:each) do
    assign(:socioeduk_quarto, Socioeduk::Quarto.new(
      :unidade_socioeducativa => nil,
      :descricao => "MyString"
    ))
  end

  xit "renders new socioeduk_quarto form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_quartos_path, "post" do

      assert_select "input[name=?]", "socioeduk_quarto[unidade_socioeducativa_id]"

      assert_select "input[name=?]", "socioeduk_quarto[descricao]"
    end
  end
end
