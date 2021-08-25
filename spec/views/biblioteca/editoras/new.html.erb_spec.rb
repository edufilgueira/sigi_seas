require 'rails_helper'

RSpec.describe "biblioteca/editoras/new", type: :view do
  before(:each) do
    assign(:biblioteca_editora, Biblioteca::Editora.new(
      :descricao => "MyString"
    ))
  end

  xit "renders new biblioteca_editora form" do
    render

    assert_select "form[action=?][method=?]", biblioteca_editoras_path, "post" do

      assert_select "input[name=?]", "biblioteca_editora[descricao]"
    end
  end
end
