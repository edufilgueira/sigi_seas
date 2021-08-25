require 'rails_helper'

RSpec.describe "biblioteca/locais/edit", type: :view do
  before(:each) do
    @biblioteca_local = assign(:biblioteca_local, Biblioteca::Local.create!(
      :nome => "MyString"
    ))
  end

  xit "renders the edit biblioteca_local form" do
    render

    assert_select "form[action=?][method=?]", biblioteca_local_path(@biblioteca_local), "post" do

      assert_select "input[name=?]", "biblioteca_local[nome]"
    end
  end
end
