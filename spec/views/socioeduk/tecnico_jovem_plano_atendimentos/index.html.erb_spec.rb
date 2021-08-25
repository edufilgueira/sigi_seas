require 'rails_helper'

RSpec.describe "socioeduk/tecnico_jovem_plano_atendimentos/index", type: :view do
  before(:each) do
    assign(:socioeduk_tecnico_jovem_plano_atendimentos, [
      Socioeduk::TecnicoJovemPlanoAtendimento.create!(
        :socioeduk_tecnico_jovem => nil,
        :unidade_socioeducativa_inclusao_id => 2
      ),
      Socioeduk::TecnicoJovemPlanoAtendimento.create!(
        :socioeduk_tecnico_jovem => nil,
        :unidade_socioeducativa_inclusao_id => 2
      )
    ])
  end

  xit "renders a list of socioeduk/tecnico_jovem_plano_atendimentos" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
