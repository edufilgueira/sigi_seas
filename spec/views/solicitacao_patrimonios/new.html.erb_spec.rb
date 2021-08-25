require 'rails_helper'

RSpec.describe "solicitacao_patrimonios/new", type: :view do
  before(:each) do
    assign(:solicitacao_patrimonio, SolicitacaoPatrimonio.new(
      :numero_solicitacao => "MyString",
      :solicitante => 1,
      :justificativa => "MyText",
      :observacao => "MyText"
    ))
  end

  it "renders new solicitacao_patrimonio form" do
    render

    assert_select "form[action=?][method=?]", solicitacao_patrimonios_path, "post" do

      assert_select "input[name=?]", "solicitacao_patrimonio[numero_solicitacao]"

      assert_select "input[name=?]", "solicitacao_patrimonio[solicitante]"

      assert_select "textarea[name=?]", "solicitacao_patrimonio[justificativa]"

      assert_select "textarea[name=?]", "solicitacao_patrimonio[observacao]"
    end
  end
end
