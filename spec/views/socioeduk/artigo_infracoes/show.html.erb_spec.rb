require 'rails_helper'

RSpec.describe "socioeduk/artigo_infracoes/show", type: :view do
  before(:each) do
    @socioeduk_artigo_infracao = assign(:socioeduk_artigo_infracao, Socioeduk::ArtigoInfracao.create!(
      :descricao => "Descricao",
      :ponderacao => "Ponderacao"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
    expect(rendered).to match(/Ponderacao/)
  end
end
