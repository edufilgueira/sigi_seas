FactoryBot.define do
  factory :socioeduk_solicitacao_vaga_infracao, class: 'Socioeduk::SolicitacaoVagaInfracao' do
    solicitacao_vaga { "" }
    tipo_natureza { "MyString" }
    artigo_infracao { "" }
    pontuacao_continuado { false }
    estupro_vulneravel { false }
  end
end
