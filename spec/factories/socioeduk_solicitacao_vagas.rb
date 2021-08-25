FactoryBot.define do
  factory :socioeduk_solicitacao_vaga, class: 'Socioeduk::SolicitacaoVaga' do
    nome { "MyString" }
    nome_mae { "MyString" }
    sexo { 1 }
    data_nascimento { "2019-09-03" }
    dependente_quimico { false }
    rg { "MyString" }
    orgao_expedidor { "MyString" }
    cpf { "MyString" }
  end
end
