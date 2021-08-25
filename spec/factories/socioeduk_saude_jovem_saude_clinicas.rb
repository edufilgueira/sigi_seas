FactoryBot.define do
  factory :socioeduk_saude_jovem_saude_clinica, class: 'Socioeduk::SaudeJovemSaudeClinica' do
    socioeduk_saude_jovem nil
    odontologico_clinico false
    socioeduk_cid nil
    diagnostico "MyString"
    socioeduk_local_tratamento nil
    outro_local_tratamento "MyString"
  end
end
