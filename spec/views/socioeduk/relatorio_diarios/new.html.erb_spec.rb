require 'rails_helper'

RSpec.describe "socioeduk/relatorio_diarios/new", type: :view do
  before(:each) do
    assign(:socioeduk_relatorio_diario, Socioeduk::RelatorioDiario.new(
      :usuario => nil,
      :unidade_socioeducativa => nil,
      :int_mas => 1,
      :int_fem => 1,
      :ip_mas => 1,
      :ip_fem => 1,
      :sl_mas => 1,
      :sl_fem => 1,
      :capacidade_nominal => 1,
      :capacidade_real => 1,
      :socioeducador_homem => 1,
      :socioeducador_mulher => 1,
      :capacidade_por_adolescente => 1,
      :evasao => 1,
      :fuga => 1,
      :descumprimento => 1,
      :situacao_crise => "MyString",
      :resumo => "MyText"
    ))
  end

  it "renders new socioeduk_relatorio_diario form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_relatorio_diarios_path, "post" do

      assert_select "input[name=?]", "socioeduk_relatorio_diario[usuario_id]"

      assert_select "input[name=?]", "socioeduk_relatorio_diario[unidade_socioeducativa_id]"

      assert_select "input[name=?]", "socioeduk_relatorio_diario[int_mas]"

      assert_select "input[name=?]", "socioeduk_relatorio_diario[int_fem]"

      assert_select "input[name=?]", "socioeduk_relatorio_diario[ip_mas]"

      assert_select "input[name=?]", "socioeduk_relatorio_diario[ip_fem]"

      assert_select "input[name=?]", "socioeduk_relatorio_diario[sl_mas]"

      assert_select "input[name=?]", "socioeduk_relatorio_diario[sl_fem]"

      assert_select "input[name=?]", "socioeduk_relatorio_diario[capacidade_nominal]"

      assert_select "input[name=?]", "socioeduk_relatorio_diario[capacidade_real]"

      assert_select "input[name=?]", "socioeduk_relatorio_diario[socioeducador_homem]"

      assert_select "input[name=?]", "socioeduk_relatorio_diario[socioeducador_mulher]"

      assert_select "input[name=?]", "socioeduk_relatorio_diario[capacidade_por_adolescente]"

      assert_select "input[name=?]", "socioeduk_relatorio_diario[evasao]"

      assert_select "input[name=?]", "socioeduk_relatorio_diario[fuga]"

      assert_select "input[name=?]", "socioeduk_relatorio_diario[descumprimento]"

      assert_select "input[name=?]", "socioeduk_relatorio_diario[situacao_crise]"

      assert_select "textarea[name=?]", "socioeduk_relatorio_diario[resumo]"
    end
  end
end
