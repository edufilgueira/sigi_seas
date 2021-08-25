require 'rails_helper'

RSpec.describe "socioeduk/blocos/show", type: :view do
  before(:each) do
    @socioeduk_bloco = assign(:socioeduk_bloco, Socioeduk::Bloco.create!(
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
