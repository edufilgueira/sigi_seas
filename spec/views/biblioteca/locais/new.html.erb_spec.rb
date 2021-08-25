require 'rails_helper'

RSpec.describe "biblioteca/locais/new", type: :view do
  before(:each) do
    assign(:biblioteca_local, Biblioteca::Local.new(
      :nome => "MyString"
    ))
  end

  xit "renders new biblioteca_local form" do
    render

    assert_select "form[action=?][method=?]", biblioteca_locais_path, "post" do

      assert_select "input[name=?]", "biblioteca_local[nome]"
    end
  end
end
