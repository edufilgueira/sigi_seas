require 'rails_helper'

RSpec.describe "biblioteca/autores/index", type: :view do
  before(:each) do
    assign(:biblioteca_autores, [
      Biblioteca::Autor.create!(
        :nome => "Nome"
      ),
      Biblioteca::Autor.create!(
        :nome => "Nome"
      )
    ])
  end

  it "renders a list of biblioteca/autores" do
    render
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
  end
end
