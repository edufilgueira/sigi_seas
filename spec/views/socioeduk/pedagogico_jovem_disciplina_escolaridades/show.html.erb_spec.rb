require 'rails_helper'

RSpec.describe "socioeduk/pedagogico_jovem_disciplina_escolaridades/show", type: :view do
  before(:each) do
    @socioeduk_pedagogico_jovem_disciplina_escolaridade = assign(:socioeduk_pedagogico_jovem_disciplina_escolaridade, Socioeduk::PedagogicoJovemDisciplinaEscolaridade.create!(
      :socioeduk_pedagogico_jovem => nil,
      :socioeduk_disciplina_escolaridade => nil,
      :socioeduk_situacao_disciplina => nil,
      :observacao => "MyText"
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
  end
end
