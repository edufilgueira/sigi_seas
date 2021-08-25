require 'rails_helper'

RSpec.describe "socioeduk/situacao_ocupacionais/show", type: :view do
  before(:each) do
    @socioeduk_situacao_ocupacional = assign(:socioeduk_situacao_ocupacional, Socioeduk::SituacaoOcupacional.create!(
      :descricao => "Descricao"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
  end
end
