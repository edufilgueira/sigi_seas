require 'rails_helper'

RSpec.describe "biblioteca/emprestimos/edit", type: :view do
  before(:each) do
    @biblioteca_emprestimo = assign(:biblioteca_emprestimo, Biblioteca::Emprestimo.create!(
      :biblioteca_livro => "MyString",
      :pessoa => FactoryBot.create(:pessoa).id,
      :status => 1,
      :nota => "MyText",
      :usuario => 1
    ))
  end

  xit "renders the edit biblioteca_emprestimo form" do
    render

    assert_select "form[action=?][method=?]", biblioteca_emprestimo_path(@biblioteca_emprestimo), "post" do

      assert_select "input[name=?]", "biblioteca_emprestimo[biblioteca_livro]"

      assert_select "input[name=?]", "biblioteca_emprestimo[pessoa_id]"

      assert_select "input[name=?]", "biblioteca_emprestimo[status]"

      assert_select "textarea[name=?]", "biblioteca_emprestimo[nota]"

      assert_select "input[name=?]", "biblioteca_emprestimo[usuario_id]"
    end
  end
end
