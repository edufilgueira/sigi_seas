require 'rails_helper'

RSpec.describe "socioeduk/pedagogico_jovem_disciplina_escolaridade_medidas/show", type: :view do
  before(:each) do
    @socioeduk_pedagogico_jovem_disciplina_escolaridade_medida = assign(:socioeduk_pedagogico_jovem_disciplina_escolaridade_medida, Socioeduk::PedagogicoJovemDisciplinaEscolaridadeMedida.create!(
      :socioeduk_pedagogico_jovem_escolaridade_medida => nil,
      :socioeduk_escolaridade => nil,
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
