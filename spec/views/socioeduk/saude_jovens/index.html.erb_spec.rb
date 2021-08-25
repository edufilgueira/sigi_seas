require 'rails_helper'

RSpec.describe "socioeduk/saude_jovens/index", type: :view do
  before(:each) do
    assign(:socioeduk_saude_jovens, [
      Socioeduk::SaudeJovem.create!(
        :socioeduk_jovem => nil,
        :cartao_sus => "Cartao Sus",
        :altura_estimada => 2.5,
        :peso_estimado => 3.5,
        :socioeduk_condicao_fisica => nil,
        :gravida => false,
        :qtd_gestacoes => 4,
        :qtd_parto_normal => 5,
        :qtd_cesariana => 6,
        :qtd_aborto => 7,
        :qtd_filhos_vivos => 8,
        :filhos_deficiente_fisico => 9,
        :metodo_contraceptivo => false,
        :usou_drogas => false,
        :historico_tratamento_psiquiatrico => false,
        :local_tratamento_psiquiatrico_id => 10,
        :outro_local_psiquiatrico => "Outro Local Psiquiatrico",
        :hipotese_diagnostica_transtorno_mental => false,
        :local_tratamento_transtorno_mental_id => 11,
        :outro_local_transtorno_mental => "Outro Local Transtorno Mental",
        :medicamento_controlado => false,
        :tentativa_suicidio => false,
        :tentativa_suicidio_familiar => false,
        :doenca_mental_familiar => false,
        :cid_mental_id => 12,
        :diagnostico_mental => "Diagnostico Mental",
        :historico_doenca_tratamento => "Historico Doenca Tratamento",
        :medicamento_doenca_cronica => false,
        :uso_protese => false,
        :uso_ortese => false,
        :fez_cirurgia => false,
        :tem_fratura => false,
        :tem_alergia_alimentar => false,
        :descricao_alergia => "Descricao Alergia",
        :tem_alergia_medicamentosa => false,
        :descricao_alergia_medicamentosa => "Descricao Alergia Medicamentosa",
        :outras_vacinas_recebidas => "Outras Vacinas Recebidas",
        :outros_exames => "Outros Exames"
      ),
      Socioeduk::SaudeJovem.create!(
        :socioeduk_jovem => nil,
        :cartao_sus => "Cartao Sus",
        :altura_estimada => 2.5,
        :peso_estimado => 3.5,
        :socioeduk_condicao_fisica => nil,
        :gravida => false,
        :qtd_gestacoes => 4,
        :qtd_parto_normal => 5,
        :qtd_cesariana => 6,
        :qtd_aborto => 7,
        :qtd_filhos_vivos => 8,
        :filhos_deficiente_fisico => 9,
        :metodo_contraceptivo => false,
        :usou_drogas => false,
        :historico_tratamento_psiquiatrico => false,
        :local_tratamento_psiquiatrico_id => 10,
        :outro_local_psiquiatrico => "Outro Local Psiquiatrico",
        :hipotese_diagnostica_transtorno_mental => false,
        :local_tratamento_transtorno_mental_id => 11,
        :outro_local_transtorno_mental => "Outro Local Transtorno Mental",
        :medicamento_controlado => false,
        :tentativa_suicidio => false,
        :tentativa_suicidio_familiar => false,
        :doenca_mental_familiar => false,
        :cid_mental_id => 12,
        :diagnostico_mental => "Diagnostico Mental",
        :historico_doenca_tratamento => "Historico Doenca Tratamento",
        :medicamento_doenca_cronica => false,
        :uso_protese => false,
        :uso_ortese => false,
        :fez_cirurgia => false,
        :tem_fratura => false,
        :tem_alergia_alimentar => false,
        :descricao_alergia => "Descricao Alergia",
        :tem_alergia_medicamentosa => false,
        :descricao_alergia_medicamentosa => "Descricao Alergia Medicamentosa",
        :outras_vacinas_recebidas => "Outras Vacinas Recebidas",
        :outros_exames => "Outros Exames"
      )
    ])
  end

  xit "renders a list of socioeduk/saude_jovens" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Cartao Sus".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => 8.to_s, :count => 2
    assert_select "tr>td", :text => 9.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 10.to_s, :count => 2
    assert_select "tr>td", :text => "Outro Local Psiquiatrico".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 11.to_s, :count => 2
    assert_select "tr>td", :text => "Outro Local Transtorno Mental".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 12.to_s, :count => 2
    assert_select "tr>td", :text => "Diagnostico Mental".to_s, :count => 2
    assert_select "tr>td", :text => "Historico Doenca Tratamento".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Descricao Alergia".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Descricao Alergia Medicamentosa".to_s, :count => 2
    assert_select "tr>td", :text => "Outras Vacinas Recebidas".to_s, :count => 2
    assert_select "tr>td", :text => "Outros Exames".to_s, :count => 2
  end
end
