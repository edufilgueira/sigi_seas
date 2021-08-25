require 'rails_helper'

RSpec.describe "socioeduk/pedagogico_jovem_profissionalizantes/index", type: :view do
  before(:each) do
    assign(:socioeduk_pedagogico_jovem_profissionalizantes, [
      Socioeduk::PedagogicoJovemProfissionalizante.create!(
        :socioeduk_pedagogico_jovem => nil,
        :socioeduk_tipo_local_curso => nil,
        :nome_programa => "Nome Programa",
        :socioeduk_tipo_curso => nil,
        :nome_curso => "Nome Curso",
        :carga_horaria => "Carga Horaria",
        :observacao => "MyText"
      ),
      Socioeduk::PedagogicoJovemProfissionalizante.create!(
        :socioeduk_pedagogico_jovem => nil,
        :socioeduk_tipo_local_curso => nil,
        :nome_programa => "Nome Programa",
        :socioeduk_tipo_curso => nil,
        :nome_curso => "Nome Curso",
        :carga_horaria => "Carga Horaria",
        :observacao => "MyText"
      )
    ])
  end

  xit "renders a list of socioeduk/pedagogico_jovem_profissionalizantes" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Nome Programa".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Nome Curso".to_s, :count => 2
    assert_select "tr>td", :text => "Carga Horaria".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
