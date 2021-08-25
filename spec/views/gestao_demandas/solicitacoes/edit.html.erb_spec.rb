require 'rails_helper'

RSpec.describe "gestao_demandas/solicitacoes/edit", type: :view do
  before(:each) do
    @gestao_demandas_solicitacao = assign(:gestao_demandas_solicitacao, GestaoDemandas::Solicitacao.create!(
      :titulo => "MyString",
      :descricao => "MyText",
      :usuario => nil
    ))
  end

  it "renders the edit gestao_demandas_solicitacao form" do
    render

    assert_select "form[action=?][method=?]", gestao_demandas_solicitacao_path(@gestao_demandas_solicitacao), "post" do

      assert_select "input[name=?]", "gestao_demandas_solicitacao[titulo]"

      assert_select "textarea[name=?]", "gestao_demandas_solicitacao[descricao]"

      assert_select "input[name=?]", "gestao_demandas_solicitacao[usuario_id]"
    end
  end
end
