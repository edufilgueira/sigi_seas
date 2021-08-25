FactoryBot.define do
  factory :socioeduk_saude_jovem_doencas_historica, class: 'Socioeduk::SaudeJovemDoencasHistorica' do
    socioeduk_saude_jovem nil
    socioeduk_cid nil
    diagnostico "MyString"
  end
end
