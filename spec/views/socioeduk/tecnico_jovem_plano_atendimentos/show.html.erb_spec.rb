require 'rails_helper'

RSpec.describe "socioeduk/tecnico_jovem_plano_atendimentos/show", type: :view do
  before(:each) do
    @socioeduk_tecnico_jovem_plano_atendimento = assign(:socioeduk_tecnico_jovem_plano_atendimento, Socioeduk::TecnicoJovemPlanoAtendimento.create!(
      :socioeduk_tecnico_jovem => nil,
      :unidade_socioeducativa_inclusao_id => 2
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
