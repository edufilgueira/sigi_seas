require 'rails_helper'

RSpec.describe "socioeduk/tecnico_jovem_plano_atendimentos/new", type: :view do
  before(:each) do
    assign(:socioeduk_tecnico_jovem_plano_atendimento, Socioeduk::TecnicoJovemPlanoAtendimento.new(
      :socioeduk_tecnico_jovem => nil,
      :unidade_socioeducativa_inclusao_id => 1
    ))
  end

  xit "renders new socioeduk_tecnico_jovem_plano_atendimento form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tecnico_jovem_plano_atendimentos_path, "post" do

      assert_select "input[name=?]", "socioeduk_tecnico_jovem_plano_atendimento[socioeduk_tecnico_jovem_id]"

      assert_select "input[name=?]", "socioeduk_tecnico_jovem_plano_atendimento[unidade_socioeducativa_inclusao_id]"
    end
  end
end
