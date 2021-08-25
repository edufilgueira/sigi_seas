FactoryBot.define do
  factory :gestao_demandas_solicitacao, class: 'GestaoDemandas::Solicitacao' do
    titulo { "MyString" }
    descricao { "MyText" }
    usuario { nil }
  end
end
