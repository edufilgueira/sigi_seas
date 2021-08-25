FactoryBot.define do
  factory :socioeduk_jovem, class: 'Socioeduk::Jovem' do
    nome "MyString"
    apelido "MyString"
    association  :uf_naturalidade, factory: :estado
    association :socioeduk_situacao_adolescente, factory: :socioeduk_situacao_adolescente
    association :opcao_sexuais, factory: :socioeduk_opcao_sexual
    association :tipo_cabelos, factory: :socioeduk_tipo_cabelo
    association :raca_cores, factory: :socioeduk_raca_core
    association :cor_olhos, factory: :socioeduk_cor_olho
  end
end