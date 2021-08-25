require 'rails_helper'

RSpec.describe "biblioteca/livros/new", type: :view do
  before(:each) do
    assign(:biblioteca_livro, Biblioteca::Livro.new(
      :titulo => "MyString",
      :sinopse => "MyText",
      :biblioteca_autor => nil,
      :biblioteca_local => nil,
      :status => false
    ))
  end

  xit "renders new biblioteca_livro form" do
    render

    assert_select "form[action=?][method=?]", biblioteca_livros_path, "post" do

      assert_select "input[name=?]", "biblioteca_livro[titulo]"

      assert_select "textarea[name=?]", "biblioteca_livro[sinopse]"

      assert_select "input[name=?]", "biblioteca_livro[biblioteca_autor_id]"

      assert_select "input[name=?]", "biblioteca_livro[biblioteca_local_id]"

      assert_select "input[name=?]", "biblioteca_livro[status]"
    end
  end
end
