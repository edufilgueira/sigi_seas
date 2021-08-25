require 'rails_helper'

RSpec.describe "socioeduk/jovem_apreensoes/index", type: :view do
  before(:each) do
    assign(:socioeduk_jovem_apreensoes, [
      Socioeduk::JovemApreensao.create!(
        :socioeduk_jovem => nil,
        :antecedente_criminal => false,
        :qtd_processo_anterior => 2,
        :dia_delegacia => 3,
        :socioeduk_tipo_medida_socioeducativa => nil,
        :socioeduk_tipo_decisao_judicial => nil,
        :qtd_dia_internacao_medida => 4
      ),
      Socioeduk::JovemApreensao.create!(
        :socioeduk_jovem => nil,
        :antecedente_criminal => false,
        :qtd_processo_anterior => 2,
        :dia_delegacia => 3,
        :socioeduk_tipo_medida_socioeducativa => nil,
        :socioeduk_tipo_decisao_judicial => nil,
        :qtd_dia_internacao_medida => 4
      )
    ])
  end

  xit "renders a list of socioeduk/jovem_apreensoes" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
