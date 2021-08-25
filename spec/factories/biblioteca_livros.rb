FactoryBot.define do
  factory :biblioteca_livro, class: 'Biblioteca::Livro' do
    titulo "MyString"
    sinopse "MyText"
    biblioteca_autor nil
    biblioteca_local nil
    status false
  end
end
