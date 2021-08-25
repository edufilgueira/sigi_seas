require 'rails_helper'

RSpec.describe "socioeduk/tecnico_jovem_visita_familiares/index", type: :view do
  before(:each) do
    assign(:socioeduk_tecnico_jovem_visita_familiares, [
      Socioeduk::TecnicoJovemVisitaFamiliar.create!(
        :socioeduk_tecnico_jovem => nil,
        :pessoa_visitada => "Pessoa Visitada",
        :finalidade_visita => "MyText",
        :responsavel_realizacao => "Responsavel Realizacao"
      ),
      Socioeduk::TecnicoJovemVisitaFamiliar.create!(
        :socioeduk_tecnico_jovem => nil,
        :pessoa_visitada => "Pessoa Visitada",
        :finalidade_visita => "MyText",
        :responsavel_realizacao => "Responsavel Realizacao"
      )
    ])
  end

  xit "renders a list of socioeduk/tecnico_jovem_visita_familiares" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Pessoa Visitada".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Responsavel Realizacao".to_s, :count => 2
  end
end
