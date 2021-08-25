require 'rails_helper'

RSpec.describe "biblioteca/livros/show", type: :view do
  before(:each) do
    @biblioteca_livro = assign(:biblioteca_livro, Biblioteca::Livro.create!(
      :titulo => "Titulo",
      :sinopse => "MyText",
      :biblioteca_autor => nil,
      :biblioteca_local => nil,
      :status => false
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(/Titulo/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
  end
end
