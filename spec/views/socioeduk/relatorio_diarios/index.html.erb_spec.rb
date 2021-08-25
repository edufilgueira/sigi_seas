require 'rails_helper'

RSpec.describe "socioeduk/relatorio_diarios/index", type: :view do
  before(:each) do
    assign(:socioeduk_relatorio_diarios, [
      Socioeduk::RelatorioDiario.create!(
        :usuario => nil,
        :unidade_socioeducativa => nil,
        :int_mas => 2,
        :int_fem => 3,
        :ip_mas => 4,
        :ip_fem => 5,
        :sl_mas => 6,
        :sl_fem => 7,
        :capacidade_nominal => 8,
        :capacidade_real => 9,
        :socioeducador_homem => 10,
        :socioeducador_mulher => 11,
        :capacidade_por_adolescente => 12,
        :evasao => 13,
        :fuga => 14,
        :descumprimento => 15,
        :situacao_crise => "Situacao Crise",
        :resumo => "MyText"
      ),
      Socioeduk::RelatorioDiario.create!(
        :usuario => nil,
        :unidade_socioeducativa => nil,
        :int_mas => 2,
        :int_fem => 3,
        :ip_mas => 4,
        :ip_fem => 5,
        :sl_mas => 6,
        :sl_fem => 7,
        :capacidade_nominal => 8,
        :capacidade_real => 9,
        :socioeducador_homem => 10,
        :socioeducador_mulher => 11,
        :capacidade_por_adolescente => 12,
        :evasao => 13,
        :fuga => 14,
        :descumprimento => 15,
        :situacao_crise => "Situacao Crise",
        :resumo => "MyText"
      )
    ])
  end

  it "renders a list of socioeduk/relatorio_diarios" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => 8.to_s, :count => 2
    assert_select "tr>td", :text => 9.to_s, :count => 2
    assert_select "tr>td", :text => 10.to_s, :count => 2
    assert_select "tr>td", :text => 11.to_s, :count => 2
    assert_select "tr>td", :text => 12.to_s, :count => 2
    assert_select "tr>td", :text => 13.to_s, :count => 2
    assert_select "tr>td", :text => 14.to_s, :count => 2
    assert_select "tr>td", :text => 15.to_s, :count => 2
    assert_select "tr>td", :text => "Situacao Crise".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
