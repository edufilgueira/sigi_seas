require 'rails_helper'

RSpec.describe "solicitacao_patrimonios/edit", type: :view do
  before(:each) do
    @solicitacao_patrimonio = assign(:solicitacao_patrimonio, SolicitacaoPatrimonio.create!(
      :numero_solicitacao => "MyString",
      :solicitante => 1,
      :justificativa => "MyText",
      :observacao => "MyText"
    ))
  end

  it "renders the edit solicitacao_patrimonio form" do
    render

    assert_select "form[action=?][method=?]", solicitacao_patrimonio_path(@solicitacao_patrimonio), "post" do

      assert_select "input[name=?]", "solicitacao_patrimonio[numero_solicitacao]"

      assert_select "input[name=?]", "solicitacao_patrimonio[solicitante]"

      assert_select "textarea[name=?]", "solicitacao_patrimonio[justificativa]"

      assert_select "textarea[name=?]", "solicitacao_patrimonio[observacao]"
    end
  end
end
