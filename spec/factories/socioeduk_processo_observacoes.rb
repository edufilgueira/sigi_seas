FactoryBot.define do
  factory :socioeduk_processo_observacao, class: 'Socioeduk::ProcessoObservacao' do
    socioeduk_processo { nil }
    observacao { "MyText" }
  end
end
