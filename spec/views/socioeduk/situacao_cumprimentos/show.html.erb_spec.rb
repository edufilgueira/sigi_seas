require 'rails_helper'

RSpec.describe "socioeduk/situacao_cumprimentos/show", type: :view do
  before(:each) do
    @socioeduk_situacao_cumprimento = assign(:socioeduk_situacao_cumprimento, Socioeduk::SituacaoCumprimento.create!(
      :descricao => "Descricao"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
  end
end
