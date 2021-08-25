require 'rails_helper'

RSpec.describe "solicitacao_patrimonios/show", type: :view do
  before(:each) do
    @solicitacao_patrimonio = assign(:solicitacao_patrimonio, SolicitacaoPatrimonio.create!(
      :numero_solicitacao => "Numero Solicitacao",
      :solicitante => 2,
      :justificativa => "MyText",
      :observacao => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Numero Solicitacao/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
