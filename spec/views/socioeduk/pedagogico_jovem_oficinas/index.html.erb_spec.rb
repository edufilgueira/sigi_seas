require 'rails_helper'

RSpec.describe "socioeduk/pedagogico_jovem_oficinas/index", type: :view do
  before(:each) do
    assign(:socioeduk_pedagogico_jovem_oficinas, [
      Socioeduk::PedagogicoJovemOficina.create!(
        :socioeduk_pedagogico_jovem => nil,
        :socioeduk_tipo_oficina => nil,
        :nome => "Nome",
        :carga_horaria => "Carga Horaria"
      ),
      Socioeduk::PedagogicoJovemOficina.create!(
        :socioeduk_pedagogico_jovem => nil,
        :socioeduk_tipo_oficina => nil,
        :nome => "Nome",
        :carga_horaria => "Carga Horaria"
      )
    ])
  end

  xit "renders a list of socioeduk/pedagogico_jovem_oficinas" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Carga Horaria".to_s, :count => 2
  end
end
