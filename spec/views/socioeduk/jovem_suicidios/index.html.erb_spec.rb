require 'rails_helper'

RSpec.describe "socioeduk/jovem_suicidios/index", type: :view do
  before(:each) do
    assign(:socioeduk_jovem_suicidios, [
      Socioeduk::JovemSuicidio.create!(
        :jovem => nil,
        :unidade_socioeducativa => nil,
        :idade => 2,
        :filiacao => "Filiacao",
        :municipio => "Municipio",
        :dia_semana => "Dia Semana",
        :metdo => "Metdo",
        :foi_planejado => false,
        :descricao_planejamento => "MyText",
        :ouve_aviso => false,
        :descricao_aviso => "MyText",
        :deixou_mensagem => false,
        :descricao_mensagem => "MyText",
        :estava_acompanhado => false,
        :descricao_acompanhamento => "MyText",
        :onde_ocorreu => "Onde Ocorreu",
        :tempo_socorro_suicidio => "Tempo Socorro Suicidio",
        :quem_socorreu => "Quem Socorreu",
        :procedimento_socorro => "MyText",
        :depressao => false,
        :apatia => false,
        :insonia => false,
        :drogas => false,
        :impulsividade => false,
        :relacionamento => false,
        :isolamento => false,
        :outros => false,
        :descrever_outros => "MyText"
      ),
      Socioeduk::JovemSuicidio.create!(
        :jovem => nil,
        :unidade_socioeducativa => nil,
        :idade => 2,
        :filiacao => "Filiacao",
        :municipio => "Municipio",
        :dia_semana => "Dia Semana",
        :metdo => "Metdo",
        :foi_planejado => false,
        :descricao_planejamento => "MyText",
        :ouve_aviso => false,
        :descricao_aviso => "MyText",
        :deixou_mensagem => false,
        :descricao_mensagem => "MyText",
        :estava_acompanhado => false,
        :descricao_acompanhamento => "MyText",
        :onde_ocorreu => "Onde Ocorreu",
        :tempo_socorro_suicidio => "Tempo Socorro Suicidio",
        :quem_socorreu => "Quem Socorreu",
        :procedimento_socorro => "MyText",
        :depressao => false,
        :apatia => false,
        :insonia => false,
        :drogas => false,
        :impulsividade => false,
        :relacionamento => false,
        :isolamento => false,
        :outros => false,
        :descrever_outros => "MyText"
      )
    ])
  end

  xit "renders a list of socioeduk/jovem_suicidios" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Filiacao".to_s, :count => 2
    assert_select "tr>td", :text => "Municipio".to_s, :count => 2
    assert_select "tr>td", :text => "Dia Semana".to_s, :count => 2
    assert_select "tr>td", :text => "Metdo".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Onde Ocorreu".to_s, :count => 2
    assert_select "tr>td", :text => "Tempo Socorro Suicidio".to_s, :count => 2
    assert_select "tr>td", :text => "Quem Socorreu".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
