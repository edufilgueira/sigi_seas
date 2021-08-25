require 'rails_helper'

RSpec.describe "gestao_demandas/solicitacoes/index", type: :view do
  before(:each) do
    assign(:gestao_demandas_solicitacoes, [
      GestaoDemandas::Solicitacao.create!(
        :titulo => "Titulo",
        :descricao => "MyText",
        :usuario => nil
      ),
      GestaoDemandas::Solicitacao.create!(
        :titulo => "Titulo",
        :descricao => "MyText",
        :usuario => nil
      )
    ])
  end

  it "renders a list of gestao_demandas/solicitacoes" do
    render
    assert_select "tr>td", :text => "Titulo".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
