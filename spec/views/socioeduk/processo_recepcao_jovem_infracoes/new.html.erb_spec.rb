require 'rails_helper'

RSpec.describe "socioeduk/processo_recepcao_jovem_infracoes/new", type: :view do
  before(:each) do
    assign(:socioeduk_processo_recepcao_jovem_infracao, Socioeduk::ProcessoRecepcaoJovemInfracao.new(
      :socioeduk_processo_recepcao_jovem => nil,
      :reincidente => false,
      :cumpre_medida => false,
      :socioeduk_medida_socioeducativa => nil,
      :mandato_apreencao => false
    ))
  end

  it "renders new socioeduk_processo_recepcao_jovem_infracao form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_processo_recepcao_jovem_infracoes_path, "post" do

      assert_select "input[name=?]", "socioeduk_processo_recepcao_jovem_infracao[socioeduk_processo_recepcao_jovem_id]"

      assert_select "input[name=?]", "socioeduk_processo_recepcao_jovem_infracao[reincidente]"

      assert_select "input[name=?]", "socioeduk_processo_recepcao_jovem_infracao[cumpre_medida]"

      assert_select "input[name=?]", "socioeduk_processo_recepcao_jovem_infracao[socioeduk_medida_socioeducativa_id]"

      assert_select "input[name=?]", "socioeduk_processo_recepcao_jovem_infracao[mandato_apreencao]"
    end
  end
end
