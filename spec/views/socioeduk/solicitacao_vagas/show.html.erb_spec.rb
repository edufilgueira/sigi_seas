require 'rails_helper'

RSpec.describe "socioeduk/solicitacao_vagas/show", type: :view do
  before(:each) do
    @socioeduk_solicitacao_vaga = assign(:socioeduk_solicitacao_vaga, Socioeduk::SolicitacaoVaga.create!(
      :nome => "Nome",
      :nome_mae => "Nome Mae",
      :sexo => 2,
      :dependente_quimico => false,
      :rg => "Rg",
      :orgao_expedidor => "Orgao Expedidor",
      :cpf => "Cpf"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Nome Mae/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Rg/)
    expect(rendered).to match(/Orgao Expedidor/)
    expect(rendered).to match(/Cpf/)
  end
end
