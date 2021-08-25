FactoryBot.define do
  factory :solicitacao_patrimonio do
    numero_solicitacao { "MyString" }
    solicitante { 1 }
    justificativa { "MyText" }
    observacao { "MyText" }
  end
end
