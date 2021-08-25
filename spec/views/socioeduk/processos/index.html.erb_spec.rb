require 'rails_helper'

RSpec.describe "socioeduk/processos/index", type: :view do
  before(:each) do
    assign(:socioeduk_processos, [
      Socioeduk::Processo.create!(
        :numero_processo => "Numero Processo",
        :socioeduk_tipo_processo => nil,
        :socioeduk_comarca => nil,
        :numero_oficio => "Numero Oficio",
        :socioeduk_situacao_processo => nil,
        :socioeduk_municipio => nil
      ),
      Socioeduk::Processo.create!(
        :numero_processo => "Numero Processo",
        :socioeduk_tipo_processo => nil,
        :socioeduk_comarca => nil,
        :numero_oficio => "Numero Oficio",
        :socioeduk_situacao_processo => nil,
        :socioeduk_municipio => nil
      )
    ])
  end

  xit "renders a list of socioeduk/processos" do
    render
    assert_select "tr>td", :text => "Numero Processo".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Numero Oficio".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
