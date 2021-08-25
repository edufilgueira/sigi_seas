FactoryBot.define do
  factory :socioeduk_saude_jovem, class: 'Socioeduk::SaudeJovem' do
    #socioeduk_jovem nil
    association :socioeduk_jovem, factory: :socioeduk_jovem
    cartao_sus "MyString"
    altura_estimada 1.5
    peso_estimado 1.5
    socioeduk_condicao_fisica nil
    gravida false
    data_ultima_menstruacao "2018-08-02"
    data_provavel_parto "2018-08-02"
    qtd_gestacoes 1
    qtd_parto_normal 1
    qtd_cesariana 1
    qtd_aborto 1
    qtd_filhos_vivos 1
    filhos_deficiente_fisico 1
    metodo_contraceptivo false
    usou_drogas false
    historico_tratamento_psiquiatrico false
    local_tratamento_psiquiatrico_id 1
    outro_local_psiquiatrico "MyString"
    tempo_psiquiatrico "2018-08-02"
    hipotese_diagnostica_transtorno_mental false
    local_tratamento_transtorno_mental_id 1
    outro_local_transtorno_mental "MyString"
    tempo_transtorno_mental "2018-08-02"
    medicamento_controlado false
    tentativa_suicidio false
    tentativa_suicidio_familiar false
    doenca_mental_familiar false
    cid_mental_id 1
    diagnostico_mental "MyString"
    historico_doenca_tratamento "MyString"
    medicamento_doenca_cronica false
    uso_protese false
    uso_ortese false
    fez_cirurgia false
    tem_fratura false
    tem_alergia_alimentar false
    descricao_alergia "MyString"
    tem_alergia_medicamentosa false
    descricao_alergia_medicamentosa "MyString"
    outras_vacinas_recebidas "MyString"
    outros_exames "MyString"
  end
end
