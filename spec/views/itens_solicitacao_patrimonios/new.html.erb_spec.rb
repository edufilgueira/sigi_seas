require 'rails_helper'

RSpec.describe "itens_solicitacao_patrimonios/new", type: :view do
  before(:each) do
    assign(:itens_solicitacao_patrimonio, ItensSolicitacaoPatrimonio.new(
      :solicitacao_patrimonio => nil,
      :item_patrimonio => nil,
      :quantidade_solicitada => 1
    ))
  end

  it "renders new itens_solicitacao_patrimonio form" do
    render

    assert_select "form[action=?][method=?]", itens_solicitacao_patrimonios_path, "post" do

      assert_select "input[name=?]", "itens_solicitacao_patrimonio[solicitacao_patrimonio_id]"

      assert_select "input[name=?]", "itens_solicitacao_patrimonio[item_patrimonio_id]"

      assert_select "input[name=?]", "itens_solicitacao_patrimonio[quantidade_solicitada]"
    end
  end
end
