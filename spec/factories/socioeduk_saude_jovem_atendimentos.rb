FactoryBot.define do
  factory :socioeduk_saude_jovem_atendimento, class: 'Socioeduk::SaudeJovemAtendimento' do
    association :socioeduk_saude_jovem, factory: :socioeduk_saude_jovem
    #socioeduk_saude_jovem nil
    #socioeduk_tipo_atendimento nil
    association :tipo_atendimento, factory: :socioeduk_tipo_atendimento
    data_atendimento "2018-08-02"
    local_atendimento 1
    outro_local_atendimento "MyString"
    #socioeduk_cid nil
    association :cid, factory: :socioeduk_cid
    diagnostico "MyString"
    nome_profissional "MyString"
    descricao_atendimento "MyString"
  end
end
