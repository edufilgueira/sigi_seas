FactoryBot.define do
  factory :socioeduk_jovem_recepcao, class: 'Socioeduk::JovemRecepcao' do
    socioeduk_jovem { nil }
    antecedentes { false }
    bo { "MyString" }
    responsavel { false }
    nome_responsavel { "MyString" }
    telefone { "MyString" }
    presenca_familiar_junto { "MyString" }
    condutor_nome { "MyString" }
    condutor_documento { "MyString" }
    condutor_cargo { "MyString" }
    datahora_apresentacao { "MyString" }
    oficio { false }
    documentos_pessoais { false }
    decisao { false }
    corpo_delito { false }
    certidao_antecedente_criminal { false }
    kit_vestuario { false }
  end
end
