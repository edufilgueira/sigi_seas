require 'rails_helper'

RSpec.describe "socioeduk/blocos/edit", type: :view do
  before(:each) do
    @socioeduk_bloco = assign(:socioeduk_bloco, Socioeduk::Bloco.create!(
      :unidade_socioeducativa => nil,
      :descricao => "MyString"
    ))
  end

  xit "renders the edit socioeduk_bloco form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_bloco_path(@socioeduk_bloco), "post" do

      assert_select "input[name=?]", "socioeduk_bloco[unidade_socioeducativa_id]"

      assert_select "input[name=?]", "socioeduk_bloco[descricao]"
    end
  end
end
