require 'rails_helper'

RSpec.describe "socioeduk/processo_recepcao_jovem_infracoes/index", type: :view do
  before(:each) do
    assign(:socioeduk_processo_recepcao_jovem_infracoes, [
      Socioeduk::ProcessoRecepcaoJovemInfracao.create!(
        :socioeduk_processo_recepcao_jovem => nil,
        :reincidente => false,
        :cumpre_medida => false,
        :socioeduk_medida_socioeducativa => nil,
        :mandato_apreencao => false
      ),
      Socioeduk::ProcessoRecepcaoJovemInfracao.create!(
        :socioeduk_processo_recepcao_jovem => nil,
        :reincidente => false,
        :cumpre_medida => false,
        :socioeduk_medida_socioeducativa => nil,
        :mandato_apreencao => false
      )
    ])
  end

  it "renders a list of socioeduk/processo_recepcao_jovem_infracoes" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
