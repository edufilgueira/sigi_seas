require 'rails_helper'

RSpec.describe "socioeduk/processo_naturezas/edit", type: :view do
  before(:each) do
    @socioeduk_processo_natureza = assign(:socioeduk_processo_natureza, Socioeduk::ProcessoNatureza.create!(
      :socioeduk_processo => "",
      :tipo_natureza => "MyString",
      :artigo => "MyString"
    ))
  end

  xit "renders the edit socioeduk_processo_natureza form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_processo_natureza_path(@socioeduk_processo_natureza), "post" do

      assert_select "input[name=?]", "socioeduk_processo_natureza[socioeduk_processo]"

      assert_select "input[name=?]", "socioeduk_processo_natureza[tipo_natureza]"

      assert_select "input[name=?]", "socioeduk_processo_natureza[artigo]"
    end
  end
end
