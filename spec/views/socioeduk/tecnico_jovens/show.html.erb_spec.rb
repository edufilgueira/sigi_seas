require 'rails_helper'

RSpec.describe "socioeduk/tecnico_jovens/show", type: :view do
  before(:each) do
    @socioeduk_tecnico_jovem = assign(:socioeduk_tecnico_jovem, Socioeduk::TecnicoJovem.create!(
      :socioeduk_jovem => nil,
      :tem_filhos => false,
      :quantos_filhos => 2,
      :socioeduk_convivio_familiar => nil,
      :codigo_familiar => "Codigo Familiar",
      :cnis => "Cnis",
      :programas_sociais => false,
      :socioeduk_renda_familiar => nil,
      :socioeduk_composicao_familiar => nil,
      :socioeduk_plano_individual_atendimento => nil,
      :nome_tecnico => "Nome Tecnico",
      :profissional_referencia => "Profissional Referencia"
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Codigo Familiar/)
    expect(rendered).to match(/Cnis/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Nome Tecnico/)
    expect(rendered).to match(/Profissional Referencia/)
  end
end
