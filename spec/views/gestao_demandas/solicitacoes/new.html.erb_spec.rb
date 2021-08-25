require 'rails_helper'

RSpec.describe "gestao_demandas/solicitacoes/new", type: :view do
  before(:each) do
    assign(:gestao_demandas_solicitacao, GestaoDemandas::Solicitacao.new(
      :titulo => "MyString",
      :descricao => "MyText",
      :usuario => nil
    ))
  end

  it "renders new gestao_demandas_solicitacao form" do
    render

    assert_select "form[action=?][method=?]", gestao_demandas_solicitacoes_path, "post" do

      assert_select "input[name=?]", "gestao_demandas_solicitacao[titulo]"

      assert_select "textarea[name=?]", "gestao_demandas_solicitacao[descricao]"

      assert_select "input[name=?]", "gestao_demandas_solicitacao[usuario_id]"
    end
  end
end
