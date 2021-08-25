require 'rails_helper'

RSpec.describe "socioeduk/solicitacao_vaga_infracoes/index", type: :view do
  before(:each) do
    assign(:socioeduk_solicitacao_vaga_infracoes, [
      Socioeduk::SolicitacaoVagaInfracao.create!(
        :solicitacao_vaga => "",
        :tipo_natureza => "Tipo Natureza",
        :artigo_infracao => "",
        :pontuacao_continuado => false,
        :estupro_vulneravel => false
      ),
      Socioeduk::SolicitacaoVagaInfracao.create!(
        :solicitacao_vaga => "",
        :tipo_natureza => "Tipo Natureza",
        :artigo_infracao => "",
        :pontuacao_continuado => false,
        :estupro_vulneravel => false
      )
    ])
  end

  it "renders a list of socioeduk/solicitacao_vaga_infracoes" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Tipo Natureza".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
