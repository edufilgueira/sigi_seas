require 'rails_helper'

RSpec.describe "socioeduk/jovem_apreensoes/new", type: :view do
  before(:each) do
    assign(:socioeduk_jovem_apreensao, Socioeduk::JovemApreensao.new(
      :socioeduk_jovem => nil,
      :antecedente_criminal => false,
      :qtd_processo_anterior => 1,
      :dia_delegacia => 1,
      :socioeduk_tipo_medida_socioeducativa => nil,
      :socioeduk_tipo_decisao_judicial => nil,
      :qtd_dia_internacao_medida => 1
    ))
  end

  xit "renders new socioeduk_jovem_apreensao form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_jovem_apreensoes_path, "post" do

      assert_select "input[name=?]", "socioeduk_jovem_apreensao[socioeduk_jovem_id]"

      assert_select "input[name=?]", "socioeduk_jovem_apreensao[antecedente_criminal]"

      assert_select "input[name=?]", "socioeduk_jovem_apreensao[qtd_processo_anterior]"

      assert_select "input[name=?]", "socioeduk_jovem_apreensao[dia_delegacia]"

      assert_select "input[name=?]", "socioeduk_jovem_apreensao[socioeduk_tipo_medida_socioeducativa_id]"

      assert_select "input[name=?]", "socioeduk_jovem_apreensao[socioeduk_tipo_decisao_judicial_id]"

      assert_select "input[name=?]", "socioeduk_jovem_apreensao[qtd_dia_internacao_medida]"
    end
  end
end
