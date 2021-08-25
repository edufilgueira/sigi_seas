require 'rails_helper'

RSpec.describe "urlbm/mapas/index", type: :view do
  before(:each) do
    assign(:urlbm_mapas, [
      Urlbm::Mapa.create!(
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
      ),
      Urlbm::Mapa.create!(
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
      )
    ])
  end

  it "renders a list of urlbm/mapas" do
    render
    assert_select "tr>td", :text => "Num Processo".to_s, :count => 2
    assert_select "tr>td", :text => "Responsavel".to_s, :count => 2
    assert_select "tr>td", :text => "Telefone".to_s, :count => 2
    assert_select "tr>td", :text => "Data Ocorrencia".to_s, :count => 2
    assert_select "tr>td", :text => "Data Admissao".to_s, :count => 2
    assert_select "tr>td", :text => "Data Nascimento".to_s, :count => 2
    assert_select "tr>td", :text => "Data Judicial".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Idade".to_s, :count => 2
    assert_select "tr>td", :text => "Bo Mapa".to_s, :count => 2
    assert_select "tr>td", :text => "Obs".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
