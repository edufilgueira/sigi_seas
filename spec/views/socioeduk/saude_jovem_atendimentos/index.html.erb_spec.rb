require 'rails_helper'

RSpec.describe "socioeduk/saude_jovem_atendimentos/index", type: :view do
  before(:each) do
    assign(:socioeduk_saude_jovem_atendimentos, [
      Socioeduk::SaudeJovemAtendimento.create!(
        :socioeduk_saude_jovem => nil,
        :socioeduk_tipo_atendimento => nil,
        :local_atendimento => 2,
        :outro_local_atendimento => "Outro Local Atendimento",
        :socioeduk_cid => nil,
        :diagnostico => "Diagnostico",
        :nome_profissional => "Nome Profissional",
        :descricao_atendimento => "Descricao Atendimento"
      ),
      Socioeduk::SaudeJovemAtendimento.create!(
        :socioeduk_saude_jovem => nil,
        :socioeduk_tipo_atendimento => nil,
        :local_atendimento => 2,
        :outro_local_atendimento => "Outro Local Atendimento",
        :socioeduk_cid => nil,
        :diagnostico => "Diagnostico",
        :nome_profissional => "Nome Profissional",
        :descricao_atendimento => "Descricao Atendimento"
      )
    ])
  end

  xit "renders a list of socioeduk/saude_jovem_atendimentos" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Outro Local Atendimento".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Diagnostico".to_s, :count => 2
    assert_select "tr>td", :text => "Nome Profissional".to_s, :count => 2
    assert_select "tr>td", :text => "Descricao Atendimento".to_s, :count => 2
  end
end
