require 'rails_helper'

RSpec.describe "biblioteca/local_publicacoes/show", type: :view do
  before(:each) do
    @biblioteca_local_publicacao = assign(:biblioteca_local_publicacao, Biblioteca::LocalPublicacao.create!(
      :descricao => "Descricao"
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
  end
end
