require 'rails_helper'

RSpec.describe "socioeduk/pedagogico_jovem_disciplina_escolaridades/index", type: :view do
  before(:each) do
    assign(:socioeduk_pedagogico_jovem_disciplina_escolaridades, [
      Socioeduk::PedagogicoJovemDisciplinaEscolaridade.create!(
        :socioeduk_pedagogico_jovem => nil,
        :socioeduk_disciplina_escolaridade => nil,
        :socioeduk_situacao_disciplina => nil,
        :observacao => "MyText"
      ),
      Socioeduk::PedagogicoJovemDisciplinaEscolaridade.create!(
        :socioeduk_pedagogico_jovem => nil,
        :socioeduk_disciplina_escolaridade => nil,
        :socioeduk_situacao_disciplina => nil,
        :observacao => "MyText"
      )
    ])
  end

  xit "renders a list of socioeduk/pedagogico_jovem_disciplina_escolaridades" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
