require 'rails_helper'

RSpec.describe "socioeduk/artigo_paragrafos/show", type: :view do
  before(:each) do
    @socioeduk_artigo_paragrafo = assign(:socioeduk_artigo_paragrafo, Socioeduk::ArtigoParagrafo.create!(
      :socioeduk_artigo_infracao => nil,
      :descricao => "Descricao"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Descricao/)
  end
end
