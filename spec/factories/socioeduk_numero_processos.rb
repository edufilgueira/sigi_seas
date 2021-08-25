FactoryBot.define do
  factory :socioeduk_numero_processo, class: 'Socioeduk::NumeroProcesso' do
    socioeduk_processo { nil }
    numero { "MyString" }
  end
end
