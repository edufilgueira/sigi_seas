FactoryBot.define do
  factory :urlbm_mapa, class: 'Urlbm::Mapa' do
    num_processo { "MyString" }
    responsavel { "MyString" }
    telefone { "MyString" }
    data_ocorrencia { "MyString" }
    data_admissao { "MyString" }
    data_nascimento { "MyString" }
    data_judicial { "MyString" }
    reincidente { false }
    idade { "MyString" }
    bo_mapa { "MyString" }
    obs { "MyString" }
    socioeduk_jovem_recepcao { nil }
    socioeduk_jovens { nil }
    urlbm_ato_infracional { nil }
    cidade { nil }
  end
end
