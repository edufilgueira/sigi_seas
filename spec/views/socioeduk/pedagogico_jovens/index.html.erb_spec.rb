require 'rails_helper'

RSpec.describe "socioeduk/pedagogico_jovens/index", type: :view do
  before(:each) do
    assign(:socioeduk_pedagogico_jovens, [
      Socioeduk::PedagogicoJovem.create!(
        :socioeduk_jovem => nil,
        :socioeduk_tipo_alfabetizado => nil,
        :socioeduk_situacao_escolar => nil,
        :socioeduk_escolaridade => nil,
        :ultima_escola_frequentada => "Ultima Escola Frequentada",
        :ultimo_ano_escolar => 2,
        :cgm => "Cgm",
        :socioeduk_situacao_ocupacional_anterior => 3,
        :socioeduk_situacao_ocupacional_atual => 4
      ),
      Socioeduk::PedagogicoJovem.create!(
        :socioeduk_jovem => nil,
        :socioeduk_tipo_alfabetizado => nil,
        :socioeduk_situacao_escolar => nil,
        :socioeduk_escolaridade => nil,
        :ultima_escola_frequentada => "Ultima Escola Frequentada",
        :ultimo_ano_escolar => 2,
        :cgm => "Cgm",
        :socioeduk_situacao_ocupacional_anterior => 3,
        :socioeduk_situacao_ocupacional_atual => 4
      )
    ])
  end

  xit "renders a list of socioeduk/pedagogico_jovens" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Ultima Escola Frequentada".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Cgm".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
