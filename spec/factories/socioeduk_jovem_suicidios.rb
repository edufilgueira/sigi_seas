FactoryBot.define do
  factory :socioeduk_jovem_suicidio, class: 'Socioeduk::JovemSuicidio' do
    jovem { nil }
    unidade_socioeducativa { nil }
    idade { 1 }
    filiacao { "MyString" }
    data_entrada_unidade { "2018-11-28" }
    municipio { "MyString" }
    data_evento { "2018-11-28 13:48:44" }
    dia_semana { "MyString" }
    metdo { "MyString" }
    foi_planejado { false }
    descricao_planejamento { "MyText" }
    ouve_aviso { false }
    descricao_aviso { "MyText" }
    deixou_mensagem { false }
    descricao_mensagem { "MyText" }
    estava_acompanhado { false }
    descricao_acompanhamento { "MyText" }
    onde_ocorreu { "MyString" }
    tempo_socorro_suicidio { "MyString" }
    quem_socorreu { "MyString" }
    procedimento_socorro { "MyText" }
    depressao { false }
    apatia { false }
    insonia { false }
    drogas { false }
    impulsividade { false }
    relacionamento { false }
    isolamento { false }
    outros { false }
    descrever_outros { "MyText" }
  end
end
