require 'rails_helper'

RSpec.describe "biblioteca/livros/edit", type: :view do
  before(:each) do
    @biblioteca_livro = assign(:biblioteca_livro, Biblioteca::Livro.create!(
      :titulo => "MyString",
      :sinopse => "MyText",
      :biblioteca_autor => FactoryBot.create(:pessoa).id,
      :biblioteca_local => nil,
      :status => false
    ))
  end

  xit "renders the edit biblioteca_livro form" do
    render

    assert_select "form[action=?][method=?]", biblioteca_livro_path(@biblioteca_livro), "post" do

      assert_select "input[name=?]", "biblioteca_livro[titulo]"

      assert_select "textarea[name=?]", "biblioteca_livro[sinopse]"

      assert_select "input[name=?]", "biblioteca_livro[biblioteca_autor_id]"

      assert_select "input[name=?]", "biblioteca_livro[biblioteca_local_id]"

      assert_select "input[name=?]", "biblioteca_livro[status]"
    end
  end
end
