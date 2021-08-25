require 'rails_helper'

RSpec.describe "socioeduk/tecnico_jovens/index", type: :view do
  before(:each) do
    assign(:socioeduk_tecnico_jovens, [
      Socioeduk::TecnicoJovem.create!(
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
      ),
      Socioeduk::TecnicoJovem.create!(
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
      )
    ])
  end

  xit "renders a list of socioeduk/tecnico_jovens" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Codigo Familiar".to_s, :count => 2
    assert_select "tr>td", :text => "Cnis".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Nome Tecnico".to_s, :count => 2
    assert_select "tr>td", :text => "Profissional Referencia".to_s, :count => 2
  end
end
