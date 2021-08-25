require 'rails_helper'

RSpec.describe "socioeduk/tecnico_jovem_visita_familiares/show", type: :view do
  before(:each) do
    @socioeduk_tecnico_jovem_visita_familiar = assign(:socioeduk_tecnico_jovem_visita_familiar, Socioeduk::TecnicoJovemVisitaFamiliar.create!(
      :socioeduk_tecnico_jovem => nil,
      :pessoa_visitada => "Pessoa Visitada",
      :finalidade_visita => "MyText",
      :responsavel_realizacao => "Responsavel Realizacao"
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Pessoa Visitada/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Responsavel Realizacao/)
  end
end
