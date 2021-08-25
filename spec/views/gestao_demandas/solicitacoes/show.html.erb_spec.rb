require 'rails_helper'

RSpec.describe "gestao_demandas/solicitacoes/show", type: :view do
  before(:each) do
    @gestao_demandas_solicitacao = assign(:gestao_demandas_solicitacao, GestaoDemandas::Solicitacao.create!(
      :titulo => "Titulo",
      :descricao => "MyText",
      :usuario => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Titulo/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
