require 'rails_helper'

RSpec.describe "itens_solicitacao_patrimonios/show", type: :view do
  before(:each) do
    @itens_solicitacao_patrimonio = assign(:itens_solicitacao_patrimonio, ItensSolicitacaoPatrimonio.create!(
      :solicitacao_patrimonio => nil,
      :item_patrimonio => nil,
      :quantidade_solicitada => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
