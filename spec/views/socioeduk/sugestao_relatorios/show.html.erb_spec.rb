require 'rails_helper'

RSpec.describe "socioeduk/sugestao_relatorios/show", type: :view do
  before(:each) do
    @socioeduk_sugestao_relatorio = assign(:socioeduk_sugestao_relatorio, Socioeduk::SugestaoRelatorio.create!(
      :descricao => "Descricao"
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
  end
end
