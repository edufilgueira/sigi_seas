require 'rails_helper'

RSpec.describe "biblioteca/autores/new", type: :view do
  before(:each) do
    assign(:biblioteca_autor, Biblioteca::Autor.new(
      :nome => "MyString"
    ))
  end

  it "renders new biblioteca_autor form" do
    render

    assert_select "form[action=?][method=?]", biblioteca_autores_path, "post" do

      assert_select "input[name=?]", "biblioteca_autor[nome]"
    end
  end
end
