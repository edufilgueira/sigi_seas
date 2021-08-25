require 'rails_helper'

RSpec.describe "socioeduk/jovem_suicidios/edit", type: :view do
  before(:each) do
    @socioeduk_jovem_suicidio = assign(:socioeduk_jovem_suicidio, Socioeduk::JovemSuicidio.create!(
      :jovem => nil,
      :unidade_socioeducativa => nil,
      :idade => 1,
      :filiacao => "MyString",
      :municipio => "MyString",
      :dia_semana => "MyString",
      :metdo => "MyString",
      :foi_planejado => false,
      :descricao_planejamento => "MyText",
      :ouve_aviso => false,
      :descricao_aviso => "MyText",
      :deixou_mensagem => false,
      :descricao_mensagem => "MyText",
      :estava_acompanhado => false,
      :descricao_acompanhamento => "MyText",
      :onde_ocorreu => "MyString",
      :tempo_socorro_suicidio => "MyString",
      :quem_socorreu => "MyString",
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

  xit "renders the edit socioeduk_jovem_suicidio form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_jovem_suicidio_path(@socioeduk_jovem_suicidio), "post" do

      assert_select "input[name=?]", "socioeduk_jovem_suicidio[jovem_id]"

      assert_select "input[name=?]", "socioeduk_jovem_suicidio[unidade_socioeducativa_id]"

      assert_select "input[name=?]", "socioeduk_jovem_suicidio[idade]"

      assert_select "input[name=?]", "socioeduk_jovem_suicidio[filiacao]"

      assert_select "input[name=?]", "socioeduk_jovem_suicidio[municipio]"

      assert_select "input[name=?]", "socioeduk_jovem_suicidio[dia_semana]"

      assert_select "input[name=?]", "socioeduk_jovem_suicidio[metdo]"

      assert_select "input[name=?]", "socioeduk_jovem_suicidio[foi_planejado]"

      assert_select "textarea[name=?]", "socioeduk_jovem_suicidio[descricao_planejamento]"

      assert_select "input[name=?]", "socioeduk_jovem_suicidio[ouve_aviso]"

      assert_select "textarea[name=?]", "socioeduk_jovem_suicidio[descricao_aviso]"

      assert_select "input[name=?]", "socioeduk_jovem_suicidio[deixou_mensagem]"

      assert_select "textarea[name=?]", "socioeduk_jovem_suicidio[descricao_mensagem]"

      assert_select "input[name=?]", "socioeduk_jovem_suicidio[estava_acompanhado]"

      assert_select "textarea[name=?]", "socioeduk_jovem_suicidio[descricao_acompanhamento]"

      assert_select "input[name=?]", "socioeduk_jovem_suicidio[onde_ocorreu]"

      assert_select "input[name=?]", "socioeduk_jovem_suicidio[tempo_socorro_suicidio]"

      assert_select "input[name=?]", "socioeduk_jovem_suicidio[quem_socorreu]"

      assert_select "textarea[name=?]", "socioeduk_jovem_suicidio[procedimento_socorro]"

      assert_select "input[name=?]", "socioeduk_jovem_suicidio[depressao]"

      assert_select "input[name=?]", "socioeduk_jovem_suicidio[apatia]"

      assert_select "input[name=?]", "socioeduk_jovem_suicidio[insonia]"

      assert_select "input[name=?]", "socioeduk_jovem_suicidio[drogas]"

      assert_select "input[name=?]", "socioeduk_jovem_suicidio[impulsividade]"

      assert_select "input[name=?]", "socioeduk_jovem_suicidio[relacionamento]"

      assert_select "input[name=?]", "socioeduk_jovem_suicidio[isolamento]"

      assert_select "input[name=?]", "socioeduk_jovem_suicidio[outros]"

      assert_select "textarea[name=?]", "socioeduk_jovem_suicidio[descrever_outros]"
    end
  end
end
