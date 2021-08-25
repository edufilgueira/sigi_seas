require 'rails_helper'

RSpec.describe "biblioteca/editoras/index", type: :view do
  before(:each) do
    assign(:biblioteca_editoras, [
      Biblioteca::Editora.create!(
        :descricao => "Descricao"
      ),
      Biblioteca::Editora.create!(
        :descricao => "Descricao"
      )
    ])
  end

  xit "renders a list of biblioteca/editoras" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
