require 'rails_helper'

RSpec.describe "socioeduk/situacao_escolares/show", type: :view do
  before(:each) do
    @socioeduk_situacao_escolar = assign(:socioeduk_situacao_escolar, Socioeduk::SituacaoEscolar.create!(
      :descricao => "Descricao"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
  end
end
