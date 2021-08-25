require 'rails_helper'

RSpec.describe "socioeduk/pedagogico_jovem_profissionalizantes/show", type: :view do
  before(:each) do
    @socioeduk_pedagogico_jovem_profissionalizante = assign(:socioeduk_pedagogico_jovem_profissionalizante, Socioeduk::PedagogicoJovemProfissionalizante.create!(
      :socioeduk_pedagogico_jovem => nil,
      :socioeduk_tipo_local_curso => nil,
      :nome_programa => "Nome Programa",
      :socioeduk_tipo_curso => nil,
      :nome_curso => "Nome Curso",
      :carga_horaria => "Carga Horaria",
      :observacao => "MyText"
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Nome Programa/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Nome Curso/)
    expect(rendered).to match(/Carga Horaria/)
    expect(rendered).to match(/MyText/)
  end
end
