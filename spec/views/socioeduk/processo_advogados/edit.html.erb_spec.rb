require 'rails_helper'

RSpec.describe "socioeduk/processo_advogados/edit", type: :view do
  before(:each) do
    @socioeduk_processo_advogado = assign(:socioeduk_processo_advogado, Socioeduk::ProcessoAdvogado.create!(
      :socioeduk_processo => nil,
      :nome => "MyString",
      :numero => "MyString",
      :uf_oab => 1,
      :defensor_publico => false,
      :unidade_socioeducativa => nil
    ))
  end

  xit "renders the edit socioeduk_processo_advogado form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_processo_advogado_path(@socioeduk_processo_advogado), "post" do

      assert_select "input[name=?]", "socioeduk_processo_advogado[socioeduk_processo_id]"

      assert_select "input[name=?]", "socioeduk_processo_advogado[nome]"

      assert_select "input[name=?]", "socioeduk_processo_advogado[numero]"

      assert_select "input[name=?]", "socioeduk_processo_advogado[uf_oab]"

      assert_select "input[name=?]", "socioeduk_processo_advogado[defensor_publico]"

      assert_select "input[name=?]", "socioeduk_processo_advogado[unidade_socioeducativa_id]"
    end
  end
end
