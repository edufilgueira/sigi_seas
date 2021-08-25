require 'rails_helper'

RSpec.describe "itens_solicitacao_patrimonios/edit", type: :view do
  before(:each) do
    @itens_solicitacao_patrimonio = assign(:itens_solicitacao_patrimonio, ItensSolicitacaoPatrimonio.create!(
      :solicitacao_patrimonio => nil,
      :item_patrimonio => nil,
      :quantidade_solicitada => 1
    ))
  end

  it "renders the edit itens_solicitacao_patrimonio form" do
    render

    assert_select "form[action=?][method=?]", itens_solicitacao_patrimonio_path(@itens_solicitacao_patrimonio), "post" do

      assert_select "input[name=?]", "itens_solicitacao_patrimonio[solicitacao_patrimonio_id]"

      assert_select "input[name=?]", "itens_solicitacao_patrimonio[item_patrimonio_id]"

      assert_select "input[name=?]", "itens_solicitacao_patrimonio[quantidade_solicitada]"
    end
  end
end
