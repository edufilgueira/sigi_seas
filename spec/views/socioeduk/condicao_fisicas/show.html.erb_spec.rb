require 'rails_helper'

RSpec.describe "socioeduk/condicao_fisicas/show", type: :view do
  before(:each) do
    @socioeduk_condicao_fisica = assign(:socioeduk_condicao_fisica, Socioeduk::CondicaoFisica.create!(
      :descricao => "Descricao"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
  end
end
