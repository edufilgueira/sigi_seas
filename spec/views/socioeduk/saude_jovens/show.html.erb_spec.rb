require 'rails_helper'

RSpec.describe "socioeduk/saude_jovens/show", type: :view do
  before(:each) do
    @socioeduk_saude_jovem = assign(:socioeduk_saude_jovem, Socioeduk::SaudeJovem.create!(
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
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Cartao Sus/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/7/)
    expect(rendered).to match(/8/)
    expect(rendered).to match(/9/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/10/)
    expect(rendered).to match(/Outro Local Psiquiatrico/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/11/)
    expect(rendered).to match(/Outro Local Transtorno Mental/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/12/)
    expect(rendered).to match(/Diagnostico Mental/)
    expect(rendered).to match(/Historico Doenca Tratamento/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Descricao Alergia/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Descricao Alergia Medicamentosa/)
    expect(rendered).to match(/Outras Vacinas Recebidas/)
    expect(rendered).to match(/Outros Exames/)
  end
end
