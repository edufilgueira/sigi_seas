require 'rails_helper'

RSpec.describe "biblioteca/editoras/edit", type: :view do
  before(:each) do
    @biblioteca_editora = assign(:biblioteca_editora, Biblioteca::Editora.create!(
      :descricao => "MyString"
    ))
  end

  xit "renders the edit biblioteca_editora form" do
    render

    assert_select "form[action=?][method=?]", biblioteca_editora_path(@biblioteca_editora), "post" do

      assert_select "input[name=?]", "biblioteca_editora[descricao]"
    end
  end
end
