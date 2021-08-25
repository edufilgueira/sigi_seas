require 'rails_helper'

RSpec.describe "socioeduk/tecnico_jovem_plano_atendimentos/edit", type: :view do
  before(:each) do
    @socioeduk_tecnico_jovem_plano_atendimento = assign(:socioeduk_tecnico_jovem_plano_atendimento, Socioeduk::TecnicoJovemPlanoAtendimento.create!(
      :socioeduk_tecnico_jovem => nil,
      :unidade_socioeducativa_inclusao_id => 1
    ))
  end

  xit "renders the edit socioeduk_tecnico_jovem_plano_atendimento form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tecnico_jovem_plano_atendimento_path(@socioeduk_tecnico_jovem_plano_atendimento), "post" do

      assert_select "input[name=?]", "socioeduk_tecnico_jovem_plano_atendimento[socioeduk_tecnico_jovem_id]"

      assert_select "input[name=?]", "socioeduk_tecnico_jovem_plano_atendimento[unidade_socioeducativa_inclusao_id]"
    end
  end
end
