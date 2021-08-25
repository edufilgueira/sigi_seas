require 'rails_helper'

RSpec.describe "socioeduk/tecnico_jovem_ultimo_relatorios/show", type: :view do
  before(:each) do
    @socioeduk_tecnico_jovem_ultimo_relatorio = assign(:socioeduk_tecnico_jovem_ultimo_relatorio, Socioeduk::TecnicoJovemUltimoRelatorio.create!(
      :socioeduk_tecnico_jovem => nil,
      :socioeduk_sugestao_relatorio => nil,
      :socioeduk_tipo_retorno => nil,
      :unidade_socioeducativa_inclusao_id => 2
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
