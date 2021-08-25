require 'rails_helper'

RSpec.describe "socioeduk/tecnico_jovem_ultimo_relatorios/new", type: :view do
  before(:each) do
    assign(:socioeduk_tecnico_jovem_ultimo_relatorio, Socioeduk::TecnicoJovemUltimoRelatorio.new(
      :socioeduk_tecnico_jovem => nil,
      :socioeduk_sugestao_relatorio => nil,
      :socioeduk_tipo_retorno => nil,
      :unidade_socioeducativa_inclusao_id => 1
    ))
  end

  xit "renders new socioeduk_tecnico_jovem_ultimo_relatorio form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tecnico_jovem_ultimo_relatorios_path, "post" do

      assert_select "input[name=?]", "socioeduk_tecnico_jovem_ultimo_relatorio[socioeduk_tecnico_jovem_id]"

      assert_select "input[name=?]", "socioeduk_tecnico_jovem_ultimo_relatorio[socioeduk_sugestao_relatorio_id]"

      assert_select "input[name=?]", "socioeduk_tecnico_jovem_ultimo_relatorio[socioeduk_tipo_retorno_id]"

      assert_select "input[name=?]", "socioeduk_tecnico_jovem_ultimo_relatorio[unidade_socioeducativa_inclusao_id]"
    end
  end
end
