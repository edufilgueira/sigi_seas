require 'rails_helper'

RSpec.describe "socioeduk/pedagogico_jovem_escolaridade_medidas/index", type: :view do
  before(:each) do
    assign(:socioeduk_pedagogico_jovem_escolaridade_medidas, [
      Socioeduk::PedagogicoJovemEscolaridadeMedida.create!(
        :socioeduk_pedagogico_jovem => nil,
        :socioeduk_escolaridade => nil,
        :socioeduk_tipo_local_curso => nil,
        :escola => "Escola",
        :ano => 2
      ),
      Socioeduk::PedagogicoJovemEscolaridadeMedida.create!(
        :socioeduk_pedagogico_jovem => nil,
        :socioeduk_escolaridade => nil,
        :socioeduk_tipo_local_curso => nil,
        :escola => "Escola",
        :ano => 2
      )
    ])
  end

  xit "renders a list of socioeduk/pedagogico_jovem_escolaridade_medidas" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Escola".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
