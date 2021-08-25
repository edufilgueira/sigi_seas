require 'rails_helper'

RSpec.describe "socioeduk/processo_naturezas/index", type: :view do
  before(:each) do
    assign(:socioeduk_processo_naturezas, [
      Socioeduk::ProcessoNatureza.create!(
        :socioeduk_processo => "",
        :tipo_natureza => "Tipo Natureza",
        :artigo => "Artigo"
      ),
      Socioeduk::ProcessoNatureza.create!(
        :socioeduk_processo => "",
        :tipo_natureza => "Tipo Natureza",
        :artigo => "Artigo"
      )
    ])
  end

  xit "renders a list of socioeduk/processo_naturezas" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Tipo Natureza".to_s, :count => 2
    assert_select "tr>td", :text => "Artigo".to_s, :count => 2
  end
end
