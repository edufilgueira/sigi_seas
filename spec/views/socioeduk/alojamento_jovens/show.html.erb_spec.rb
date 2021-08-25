require 'rails_helper'

RSpec.describe "socioeduk/alojamento_jovens/show", type: :view do
  before(:each) do
    @socioeduk_alojamento_jovem = assign(:socioeduk_alojamento_jovem, Socioeduk::AlojamentoJovem.create!(
      :socioeduk_jovem => nil,
      :unidade_socioeducativa => nil,
      :socioeduk_bloco => nil,
      :socioeduk_quarto => nil,
      :tamanho_roupa => "Tamanho Roupa",
      :tamanho_cacaldo => "Tamanho Cacaldo",
      :numero_kit => "Numero Kit"
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Tamanho Roupa/)
    expect(rendered).to match(/Tamanho Cacaldo/)
    expect(rendered).to match(/Numero Kit/)
  end
end
