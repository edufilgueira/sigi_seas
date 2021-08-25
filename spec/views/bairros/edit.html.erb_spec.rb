require 'rails_helper'

RSpec.describe "bairros/edit", type: :view do
  before(:each) do
    @bairro = assign(:bairro, Bairro.create!(
      :Cidade => "",
      :nome => "MyString"
    ))
  end

  it "renders the edit bairro form" do
    render

    assert_select "form[action=?][method=?]", bairro_path(@bairro), "post" do

      assert_select "input[name=?]", "bairro[Cidade]"

      assert_select "input[name=?]", "bairro[nome]"
    end
  end
end
