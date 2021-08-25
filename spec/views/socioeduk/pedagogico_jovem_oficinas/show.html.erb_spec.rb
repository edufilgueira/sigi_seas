require 'rails_helper'

RSpec.describe "socioeduk/pedagogico_jovem_oficinas/show", type: :view do
  before(:each) do
    @socioeduk_pedagogico_jovem_oficina = assign(:socioeduk_pedagogico_jovem_oficina, Socioeduk::PedagogicoJovemOficina.create!(
      :socioeduk_pedagogico_jovem => nil,
      :socioeduk_tipo_oficina => nil,
      :nome => "Nome",
      :carga_horaria => "Carga Horaria"
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Carga Horaria/)
  end
end
