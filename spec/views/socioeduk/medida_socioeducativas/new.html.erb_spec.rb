require 'rails_helper'

RSpec.describe "socioeduk/medida_socioeducativas/new", type: :view do
  before(:each) do
    assign(:socioeduk_medida_socioeducativa, Socioeduk::MedidaSocioeducativa.new(
      :socioeduk_processo => nil,
      :socioeduk_tipo_medida_socioeducativa => nil,
      :socioeduk_situacao_cumprimento => nil,
      :socioeduk_circunstancia => nil,
      :periodo_dias => 1
    ))
  end

  it "renders new socioeduk_medida_socioeducativa form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_medida_socioeducativas_path, "post" do

      assert_select "input[name=?]", "socioeduk_medida_socioeducativa[socioeduk_processo_id]"

      assert_select "input[name=?]", "socioeduk_medida_socioeducativa[socioeduk_tipo_medida_socioeducativa_id]"

      assert_select "input[name=?]", "socioeduk_medida_socioeducativa[socioeduk_situacao_cumprimento_id]"

      assert_select "input[name=?]", "socioeduk_medida_socioeducativa[socioeduk_circunstancia_id]"

      assert_select "input[name=?]", "socioeduk_medida_socioeducativa[periodo_dias]"
    end
  end
end
