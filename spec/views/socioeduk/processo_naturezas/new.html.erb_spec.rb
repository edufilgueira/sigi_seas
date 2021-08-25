require 'rails_helper'

RSpec.describe "socioeduk/processo_naturezas/new", type: :view do
  before(:each) do
    assign(:socioeduk_processo_natureza, Socioeduk::ProcessoNatureza.new(
      :socioeduk_processo => "",
      :tipo_natureza => "MyString",
      :artigo => "MyString"
    ))
  end

  xit "renders new socioeduk_processo_natureza form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_processo_naturezas_path, "post" do

      assert_select "input[name=?]", "socioeduk_processo_natureza[socioeduk_processo]"

      assert_select "input[name=?]", "socioeduk_processo_natureza[tipo_natureza]"

      assert_select "input[name=?]", "socioeduk_processo_natureza[artigo]"
    end
  end
end
