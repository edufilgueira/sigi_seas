require 'rails_helper'

RSpec.describe "socioeduk/relatorio_diarios/show", type: :view do
  before(:each) do
    @socioeduk_relatorio_diario = assign(:socioeduk_relatorio_diario, Socioeduk::RelatorioDiario.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/7/)
    expect(rendered).to match(/8/)
    expect(rendered).to match(/9/)
    expect(rendered).to match(/10/)
    expect(rendered).to match(/11/)
    expect(rendered).to match(/12/)
    expect(rendered).to match(/13/)
    expect(rendered).to match(/14/)
    expect(rendered).to match(/15/)
    expect(rendered).to match(/Situacao Crise/)
    expect(rendered).to match(/MyText/)
  end
end
