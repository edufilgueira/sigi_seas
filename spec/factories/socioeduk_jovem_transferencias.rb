FactoryBot.define do
  factory :socioeduk_jovem_transferencia, class: 'Socioeduk::JovemTransferencia' do
    socioeduk_jovem { nil }
    unidade_socioeducativa { nil }
  end
end
