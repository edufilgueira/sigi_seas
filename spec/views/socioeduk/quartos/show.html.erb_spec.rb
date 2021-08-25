require 'rails_helper'

RSpec.describe "socioeduk/quartos/show", type: :view do
  before(:each) do
    @socioeduk_quarto = assign(:socioeduk_quarto, Socioeduk::Quarto.create!(
      :unidade_socioeducativa => nil,
      :descricao => "Descricao"
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Descricao/)
  end
end
