require 'rails_helper'

RSpec.describe "biblioteca/autores/edit", type: :view do
  before(:each) do
    @biblioteca_autor = assign(:biblioteca_autor, Biblioteca::Autor.create!(
      :nome => "MyString"
    ))
  end

  it "renders the edit biblioteca_autor form" do
    render

    assert_select "form[action=?][method=?]", biblioteca_autor_path(@biblioteca_autor), "post" do

      assert_select "input[name=?]", "biblioteca_autor[nome]"
    end
  end
end
