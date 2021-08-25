require 'rails_helper'

RSpec.describe "solicitacao_patrimonios/index", type: :view do
  before(:each) do
    assign(:solicitacao_patrimonios, [
      SolicitacaoPatrimonio.create!(
        :numero_solicitacao => "Numero Solicitacao",
        :solicitante => 2,
        :justificativa => "MyText",
        :observacao => "MyText"
      ),
      SolicitacaoPatrimonio.create!(
        :numero_solicitacao => "Numero Solicitacao",
        :solicitante => 2,
        :justificativa => "MyText",
        :observacao => "MyText"
      )
    ])
  end

  it "renders a list of solicitacao_patrimonios" do
    render
    assert_select "tr>td", :text => "Numero Solicitacao".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
