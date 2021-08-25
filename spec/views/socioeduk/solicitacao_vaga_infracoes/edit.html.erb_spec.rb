require 'rails_helper'

RSpec.describe "socioeduk/solicitacao_vaga_infracoes/edit", type: :view do
  before(:each) do
    @socioeduk_solicitacao_vaga_infracao = assign(:socioeduk_solicitacao_vaga_infracao, Socioeduk::SolicitacaoVagaInfracao.create!(
      :solicitacao_vaga => "",
      :tipo_natureza => "MyString",
      :artigo_infracao => "",
      :pontuacao_continuado => false,
      :estupro_vulneravel => false
    ))
  end

  it "renders the edit socioeduk_solicitacao_vaga_infracao form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_solicitacao_vaga_infracao_path(@socioeduk_solicitacao_vaga_infracao), "post" do

      assert_select "input[name=?]", "socioeduk_solicitacao_vaga_infracao[solicitacao_vaga]"

      assert_select "input[name=?]", "socioeduk_solicitacao_vaga_infracao[tipo_natureza]"

      assert_select "input[name=?]", "socioeduk_solicitacao_vaga_infracao[artigo_infracao]"

      assert_select "input[name=?]", "socioeduk_solicitacao_vaga_infracao[pontuacao_continuado]"

      assert_select "input[name=?]", "socioeduk_solicitacao_vaga_infracao[estupro_vulneravel]"
    end
  end
end
