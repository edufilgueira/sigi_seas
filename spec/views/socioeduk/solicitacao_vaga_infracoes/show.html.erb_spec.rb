require 'rails_helper'

RSpec.describe "socioeduk/solicitacao_vaga_infracoes/show", type: :view do
  before(:each) do
    @socioeduk_solicitacao_vaga_infracao = assign(:socioeduk_solicitacao_vaga_infracao, Socioeduk::SolicitacaoVagaInfracao.create!(
      :solicitacao_vaga => "",
      :tipo_natureza => "Tipo Natureza",
      :artigo_infracao => "",
      :pontuacao_continuado => false,
      :estupro_vulneravel => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Tipo Natureza/)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
  end
end
