require 'rails_helper'

RSpec.describe "socioeduk/saude_jovem_atendimentos/show", type: :view do
  before(:each) do
    @socioeduk_saude_jovem_atendimento = assign(:socioeduk_saude_jovem_atendimento, Socioeduk::SaudeJovemAtendimento.create!(
      :socioeduk_saude_jovem => nil,
      :socioeduk_tipo_atendimento => nil,
      :local_atendimento => 2,
      :outro_local_atendimento => "Outro Local Atendimento",
      :socioeduk_cid => nil,
      :diagnostico => "Diagnostico",
      :nome_profissional => "Nome Profissional",
      :descricao_atendimento => "Descricao Atendimento"
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Outro Local Atendimento/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Diagnostico/)
    expect(rendered).to match(/Nome Profissional/)
    expect(rendered).to match(/Descricao Atendimento/)
  end
end
