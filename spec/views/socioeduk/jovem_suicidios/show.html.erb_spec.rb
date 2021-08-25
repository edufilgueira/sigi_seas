require 'rails_helper'

RSpec.describe "socioeduk/jovem_suicidios/show", type: :view do
  before(:each) do
    @socioeduk_jovem_suicidio = assign(:socioeduk_jovem_suicidio, Socioeduk::JovemSuicidio.create!(
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
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Filiacao/)
    expect(rendered).to match(/Municipio/)
    expect(rendered).to match(/Dia Semana/)
    expect(rendered).to match(/Metdo/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Onde Ocorreu/)
    expect(rendered).to match(/Tempo Socorro Suicidio/)
    expect(rendered).to match(/Quem Socorreu/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/MyText/)
  end
end
