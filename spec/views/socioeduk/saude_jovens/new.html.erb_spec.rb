require 'rails_helper'

RSpec.describe "socioeduk/saude_jovens/new", type: :view do
  before(:each) do
    assign(:socioeduk_saude_jovem, Socioeduk::SaudeJovem.new(
      :socioeduk_jovem => nil,
      :cartao_sus => "MyString",
      :altura_estimada => 1.5,
      :peso_estimado => 1.5,
      :socioeduk_condicao_fisica => nil,
      :gravida => false,
      :qtd_gestacoes => 1,
      :qtd_parto_normal => 1,
      :qtd_cesariana => 1,
      :qtd_aborto => 1,
      :qtd_filhos_vivos => 1,
      :filhos_deficiente_fisico => 1,
      :metodo_contraceptivo => false,
      :usou_drogas => false,
      :historico_tratamento_psiquiatrico => false,
      :local_tratamento_psiquiatrico_id => 1,
      :outro_local_psiquiatrico => "MyString",
      :hipotese_diagnostica_transtorno_mental => false,
      :local_tratamento_transtorno_mental_id => 1,
      :outro_local_transtorno_mental => "MyString",
      :medicamento_controlado => false,
      :tentativa_suicidio => false,
      :tentativa_suicidio_familiar => false,
      :doenca_mental_familiar => false,
      :cid_mental_id => 1,
      :diagnostico_mental => "MyString",
      :historico_doenca_tratamento => "MyString",
      :medicamento_doenca_cronica => false,
      :uso_protese => false,
      :uso_ortese => false,
      :fez_cirurgia => false,
      :tem_fratura => false,
      :tem_alergia_alimentar => false,
      :descricao_alergia => "MyString",
      :tem_alergia_medicamentosa => false,
      :descricao_alergia_medicamentosa => "MyString",
      :outras_vacinas_recebidas => "MyString",
      :outros_exames => "MyString"
    ))
  end

  xit "renders new socioeduk_saude_jovem form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_saude_jovens_path, "post" do

      assert_select "input[name=?]", "socioeduk_saude_jovem[socioeduk_jovem_id]"

      assert_select "input[name=?]", "socioeduk_saude_jovem[cartao_sus]"

      assert_select "input[name=?]", "socioeduk_saude_jovem[altura_estimada]"

      assert_select "input[name=?]", "socioeduk_saude_jovem[peso_estimado]"

      assert_select "input[name=?]", "socioeduk_saude_jovem[socioeduk_condicao_fisica_id]"

      assert_select "input[name=?]", "socioeduk_saude_jovem[gravida]"

      assert_select "input[name=?]", "socioeduk_saude_jovem[qtd_gestacoes]"

      assert_select "input[name=?]", "socioeduk_saude_jovem[qtd_parto_normal]"

      assert_select "input[name=?]", "socioeduk_saude_jovem[qtd_cesariana]"

      assert_select "input[name=?]", "socioeduk_saude_jovem[qtd_aborto]"

      assert_select "input[name=?]", "socioeduk_saude_jovem[qtd_filhos_vivos]"

      assert_select "input[name=?]", "socioeduk_saude_jovem[filhos_deficiente_fisico]"

      assert_select "input[name=?]", "socioeduk_saude_jovem[metodo_contraceptivo]"

      assert_select "input[name=?]", "socioeduk_saude_jovem[usou_drogas]"

      assert_select "input[name=?]", "socioeduk_saude_jovem[historico_tratamento_psiquiatrico]"

      assert_select "input[name=?]", "socioeduk_saude_jovem[local_tratamento_psiquiatrico_id]"

      assert_select "input[name=?]", "socioeduk_saude_jovem[outro_local_psiquiatrico]"

      assert_select "input[name=?]", "socioeduk_saude_jovem[hipotese_diagnostica_transtorno_mental]"

      assert_select "input[name=?]", "socioeduk_saude_jovem[local_tratamento_transtorno_mental_id]"

      assert_select "input[name=?]", "socioeduk_saude_jovem[outro_local_transtorno_mental]"

      assert_select "input[name=?]", "socioeduk_saude_jovem[medicamento_controlado]"

      assert_select "input[name=?]", "socioeduk_saude_jovem[tentativa_suicidio]"

      assert_select "input[name=?]", "socioeduk_saude_jovem[tentativa_suicidio_familiar]"

      assert_select "input[name=?]", "socioeduk_saude_jovem[doenca_mental_familiar]"

      assert_select "input[name=?]", "socioeduk_saude_jovem[cid_mental_id]"

      assert_select "input[name=?]", "socioeduk_saude_jovem[diagnostico_mental]"

      assert_select "input[name=?]", "socioeduk_saude_jovem[historico_doenca_tratamento]"

      assert_select "input[name=?]", "socioeduk_saude_jovem[medicamento_doenca_cronica]"

      assert_select "input[name=?]", "socioeduk_saude_jovem[uso_protese]"

      assert_select "input[name=?]", "socioeduk_saude_jovem[uso_ortese]"

      assert_select "input[name=?]", "socioeduk_saude_jovem[fez_cirurgia]"

      assert_select "input[name=?]", "socioeduk_saude_jovem[tem_fratura]"

      assert_select "input[name=?]", "socioeduk_saude_jovem[tem_alergia_alimentar]"

      assert_select "input[name=?]", "socioeduk_saude_jovem[descricao_alergia]"

      assert_select "input[name=?]", "socioeduk_saude_jovem[tem_alergia_medicamentosa]"

      assert_select "input[name=?]", "socioeduk_saude_jovem[descricao_alergia_medicamentosa]"

      assert_select "input[name=?]", "socioeduk_saude_jovem[outras_vacinas_recebidas]"

      assert_select "input[name=?]", "socioeduk_saude_jovem[outros_exames]"
    end
  end
end
