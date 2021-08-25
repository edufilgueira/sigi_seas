FactoryBot.define do
  factory :socioeduk_relatorio_diario, class: 'Socioeduk::RelatorioDiario' do
    usuario { nil }
    unidade_socioeducativa { nil }
    int_mas { 1 }
    int_fem { 1 }
    ip_mas { 1 }
    ip_fem { 1 }
    sl_mas { 1 }
    sl_fem { 1 }
    capacidade_nominal { 1 }
    capacidade_real { 1 }
    socioeducador_homem { 1 }
    socioeducador_mulher { 1 }
    capacidade_por_adolescente { 1 }
    evasao { 1 }
    fuga { 1 }
    descumprimento { 1 }
    situacao_crise { "MyString" }
    resumo { "MyText" }
  end
end
