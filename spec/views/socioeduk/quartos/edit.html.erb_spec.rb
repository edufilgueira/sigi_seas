require 'rails_helper'

RSpec.describe "socioeduk/quartos/edit", type: :view do
  before(:each) do
    @socioeduk_quarto = assign(:socioeduk_quarto, Socioeduk::Quarto.create!(
      :unidade_socioeducativa => nil,
      :descricao => "MyString"
    ))
  end

  xit "renders the edit socioeduk_quarto form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_quarto_path(@socioeduk_quarto), "post" do

      assert_select "input[name=?]", "socioeduk_quarto[unidade_socioeducativa_id]"

      assert_select "input[name=?]", "socioeduk_quarto[descricao]"
    end
  end
end
