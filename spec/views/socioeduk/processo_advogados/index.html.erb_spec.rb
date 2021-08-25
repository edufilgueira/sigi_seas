require 'rails_helper'

RSpec.describe "socioeduk/processo_advogados/index", type: :view do
  before(:each) do
    assign(:socioeduk_processo_advogados, [
      Socioeduk::ProcessoAdvogado.create!(
        :socioeduk_processo => nil,
        :nome => "Nome",
        :numero => "Numero",
        :uf_oab => 2,
        :defensor_publico => false,
        :unidade_socioeducativa => nil
      ),
      Socioeduk::ProcessoAdvogado.create!(
        :socioeduk_processo => nil,
        :nome => "Nome",
        :numero => "Numero",
        :uf_oab => 2,
        :defensor_publico => false,
        :unidade_socioeducativa => nil
      )
    ])
  end

  xit "renders a list of socioeduk/processo_advogados" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Numero".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
