require 'rails_helper'

RSpec.describe "socioeduk/processo_recepcao_jovem_infracoes/show", type: :view do
  before(:each) do
    @socioeduk_processo_recepcao_jovem_infracao = assign(:socioeduk_processo_recepcao_jovem_infracao, Socioeduk::ProcessoRecepcaoJovemInfracao.create!(
      :socioeduk_processo_recepcao_jovem => nil,
      :reincidente => false,
      :cumpre_medida => false,
      :socioeduk_medida_socioeducativa => nil,
      :mandato_apreencao => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
  end
end
