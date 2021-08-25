require 'rails_helper'

RSpec.describe "biblioteca/emprestimos/new", type: :view do
  before(:each) do
    assign(:biblioteca_emprestimo, Biblioteca::Emprestimo.new(
      :biblioteca_livro => "MyString",
      :pessoa => nil,
      :status => 1,
      :nota => "MyText",
      :usuario => nil
    ))
  end

  xit "renders new biblioteca_emprestimo form" do
    render

    assert_select "form[action=?][method=?]", biblioteca_emprestimos_path, "post" do

      assert_select "input[name=?]", "biblioteca_emprestimo[biblioteca_livro]"

      assert_select "input[name=?]", "biblioteca_emprestimo[pessoa_id]"

      assert_select "input[name=?]", "biblioteca_emprestimo[status]"

      assert_select "textarea[name=?]", "biblioteca_emprestimo[nota]"

      assert_select "input[name=?]", "biblioteca_emprestimo[usuario_id]"
    end
  end
end
