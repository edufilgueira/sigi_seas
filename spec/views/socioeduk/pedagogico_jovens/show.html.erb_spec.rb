require 'rails_helper'

RSpec.describe "socioeduk/pedagogico_jovens/show", type: :view do
  before(:each) do
    @socioeduk_pedagogico_jovem = assign(:socioeduk_pedagogico_jovem, Socioeduk::PedagogicoJovem.create!(
      :socioeduk_jovem => nil,
      :socioeduk_tipo_alfabetizado => nil,
      :socioeduk_situacao_escolar => nil,
      :socioeduk_escolaridade => nil,
      :ultima_escola_frequentada => "Ultima Escola Frequentada",
      :ultimo_ano_escolar => 2,
      :cgm => "Cgm",
      :socioeduk_situacao_ocupacional_anterior => 3,
      :socioeduk_situacao_ocupacional_atual => 4
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Ultima Escola Frequentada/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Cgm/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
