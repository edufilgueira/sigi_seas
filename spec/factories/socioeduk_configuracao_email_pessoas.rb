FactoryBot.define do
  factory :socioeduk_configuracao_email_pessoa, class: 'Socioeduk::ConfiguracaoEmailPessoa' do
    socioeduk_configuracao_email { nil }
    identificacao { "MyString" }
    email { "MyString" }
  end
end
