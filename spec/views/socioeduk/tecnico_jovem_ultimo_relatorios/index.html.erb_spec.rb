require 'rails_helper'

RSpec.describe "socioeduk/tecnico_jovem_ultimo_relatorios/index", type: :view do
  before(:each) do
    assign(:socioeduk_tecnico_jovem_ultimo_relatorios, [
      Socioeduk::TecnicoJovemUltimoRelatorio.create!(
        :socioeduk_tecnico_jovem => nil,
        :socioeduk_sugestao_relatorio => nil,
        :socioeduk_tipo_retorno => nil,
        :unidade_socioeducativa_inclusao_id => 2
      ),
      Socioeduk::TecnicoJovemUltimoRelatorio.create!(
        :socioeduk_tecnico_jovem => nil,
        :socioeduk_sugestao_relatorio => nil,
        :socioeduk_tipo_retorno => nil,
        :unidade_socioeducativa_inclusao_id => 2
      )
    ])
  end

  xit "renders a list of socioeduk/tecnico_jovem_ultimo_relatorios" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
