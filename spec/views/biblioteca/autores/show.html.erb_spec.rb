require 'rails_helper'

RSpec.describe "biblioteca/autores/show", type: :view do
  before(:each) do
    @biblioteca_autor = assign(:biblioteca_autor, Biblioteca::Autor.create!(
      :nome => "Nome"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
  end
end