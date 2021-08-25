require 'rails_helper'

RSpec.describe "socioeduk/situacao_processos/show", type: :view do
  before(:each) do
    @socioeduk_situacao_processo = assign(:socioeduk_situacao_processo, Socioeduk::SituacaoProcesso.create!(
      :descricao => "Descricao"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
  end
end
