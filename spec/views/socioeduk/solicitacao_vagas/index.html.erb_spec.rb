require 'rails_helper'

RSpec.describe "socioeduk/solicitacao_vagas/index", type: :view do
  before(:each) do
    assign(:socioeduk_solicitacao_vagas, [
      Socioeduk::SolicitacaoVaga.create!(
        :nome => "Nome",
        :nome_mae => "Nome Mae",
        :sexo => 2,
        :dependente_quimico => false,
        :rg => "Rg",
        :orgao_expedidor => "Orgao Expedidor",
        :cpf => "Cpf"
      ),
      Socioeduk::SolicitacaoVaga.create!(
        :nome => "Nome",
        :nome_mae => "Nome Mae",
        :sexo => 2,
        :dependente_quimico => false,
        :rg => "Rg",
        :orgao_expedidor => "Orgao Expedidor",
        :cpf => "Cpf"
      )
    ])
  end

  it "renders a list of socioeduk/solicitacao_vagas" do
    render
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Nome Mae".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Rg".to_s, :count => 2
    assert_select "tr>td", :text => "Orgao Expedidor".to_s, :count => 2
    assert_select "tr>td", :text => "Cpf".to_s, :count => 2
  end
end
