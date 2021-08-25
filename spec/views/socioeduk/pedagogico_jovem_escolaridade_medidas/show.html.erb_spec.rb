require 'rails_helper'

RSpec.describe "socioeduk/pedagogico_jovem_escolaridade_medidas/show", type: :view do
  before(:each) do
    @socioeduk_pedagogico_jovem_escolaridade_medida = assign(:socioeduk_pedagogico_jovem_escolaridade_medida, Socioeduk::PedagogicoJovemEscolaridadeMedida.create!(
      :socioeduk_pedagogico_jovem => nil,
      :socioeduk_escolaridade => nil,
      :socioeduk_tipo_local_curso => nil,
      :escola => "Escola",
      :ano => 2
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Escola/)
    expect(rendered).to match(/2/)
  end
end
