require 'rails_helper'

RSpec.describe "socioeduk/solicitacao_vagas/new", type: :view do
  before(:each) do
    assign(:socioeduk_solicitacao_vaga, Socioeduk::SolicitacaoVaga.new(
      :nome => "MyString",
      :nome_mae => "MyString",
      :sexo => 1,
      :dependente_quimico => false,
      :rg => "MyString",
      :orgao_expedidor => "MyString",
      :cpf => "MyString"
    ))
  end

  it "renders new socioeduk_solicitacao_vaga form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_solicitacao_vagas_path, "post" do

      assert_select "input[name=?]", "socioeduk_solicitacao_vaga[nome]"

      assert_select "input[name=?]", "socioeduk_solicitacao_vaga[nome_mae]"

      assert_select "input[name=?]", "socioeduk_solicitacao_vaga[sexo]"

      assert_select "input[name=?]", "socioeduk_solicitacao_vaga[dependente_quimico]"

      assert_select "input[name=?]", "socioeduk_solicitacao_vaga[rg]"

      assert_select "input[name=?]", "socioeduk_solicitacao_vaga[orgao_expedidor]"

      assert_select "input[name=?]", "socioeduk_solicitacao_vaga[cpf]"
    end
  end
end
