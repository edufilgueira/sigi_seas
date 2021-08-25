require 'rails_helper'

RSpec.describe "urlbm/mapas/show", type: :view do
  before(:each) do
    @urlbm_mapa = assign(:urlbm_mapa, Urlbm::Mapa.create!(
      :num_processo => "Num Processo",
      :responsavel => "Responsavel",
      :telefone => "Telefone",
      :data_ocorrencia => "Data Ocorrencia",
      :data_admissao => "Data Admissao",
      :data_nascimento => "Data Nascimento",
      :data_judicial => "Data Judicial",
      :reincidente => false,
      :idade => "Idade",
      :bo_mapa => "Bo Mapa",
      :obs => "Obs",
      :socioeduk_jovem_recepcao => nil,
      :socioeduk_jovens => nil,
      :urlbm_ato_infracional => nil,
      :cidade => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Num Processo/)
    expect(rendered).to match(/Responsavel/)
    expect(rendered).to match(/Telefone/)
    expect(rendered).to match(/Data Ocorrencia/)
    expect(rendered).to match(/Data Admissao/)
    expect(rendered).to match(/Data Nascimento/)
    expect(rendered).to match(/Data Judicial/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Idade/)
    expect(rendered).to match(/Bo Mapa/)
    expect(rendered).to match(/Obs/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
