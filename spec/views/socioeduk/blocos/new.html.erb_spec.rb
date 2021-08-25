require 'rails_helper'

RSpec.describe "socioeduk/blocos/new", type: :view do
  before(:each) do
    assign(:socioeduk_bloco, Socioeduk::Bloco.new(
      :unidade_socioeducativa => nil,
      :descricao => "MyString"
    ))
  end

  xit "renders new socioeduk_bloco form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_blocos_path, "post" do

      assert_select "input[name=?]", "socioeduk_bloco[unidade_socioeducativa_id]"

      assert_select "input[name=?]", "socioeduk_bloco[descricao]"
    end
  end
end
