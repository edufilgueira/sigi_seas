require 'rails_helper'

RSpec.describe "socioeduk/jovem_saidas/index", type: :view do
  before(:each) do
    assign(:socioeduk_jovem_saidas, [
      Socioeduk::JovemSaida.create!(
        :socioeduk_jovem => nil,
        :destino => "Destino",
        :observacao => "Observacao",
        :text => "Text"
      ),
      Socioeduk::JovemSaida.create!(
        :socioeduk_jovem => nil,
        :destino => "Destino",
        :observacao => "Observacao",
        :text => "Text"
      )
    ])
  end

  xit "renders a list of socioeduk/jovem_saidas" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Destino".to_s, :count => 2
    assert_select "tr>td", :text => "Observacao".to_s, :count => 2
    assert_select "tr>td", :text => "Text".to_s, :count => 2
  end
end
