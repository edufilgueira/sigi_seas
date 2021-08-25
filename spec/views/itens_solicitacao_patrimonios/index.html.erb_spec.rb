require 'rails_helper'

RSpec.describe "itens_solicitacao_patrimonios/index", type: :view do
  before(:each) do
    assign(:itens_solicitacao_patrimonios, [
      ItensSolicitacaoPatrimonio.create!(
        :solicitacao_patrimonio => nil,
        :item_patrimonio => nil,
        :quantidade_solicitada => 2
      ),
      ItensSolicitacaoPatrimonio.create!(
        :solicitacao_patrimonio => nil,
        :item_patrimonio => nil,
        :quantidade_solicitada => 2
      )
    ])
  end

  it "renders a list of itens_solicitacao_patrimonios" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
