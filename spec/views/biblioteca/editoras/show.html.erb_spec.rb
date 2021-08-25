require 'rails_helper'

RSpec.describe "biblioteca/editoras/show", type: :view do
  before(:each) do
    @biblioteca_editora = assign(:biblioteca_editora, Biblioteca::Editora.create!(
      :descricao => "Descricao"
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
  end
end
