require 'rails_helper'

RSpec.describe "socioeduk/processo_advogados/show", type: :view do
  before(:each) do
    @socioeduk_processo_advogado = assign(:socioeduk_processo_advogado, Socioeduk::ProcessoAdvogado.create!(
      :socioeduk_processo => nil,
      :nome => "Nome",
      :numero => "Numero",
      :uf_oab => 2,
      :defensor_publico => false,
      :unidade_socioeducativa => nil
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Numero/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
