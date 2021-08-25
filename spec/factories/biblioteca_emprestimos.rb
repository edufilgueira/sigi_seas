FactoryBot.define do
  factory :biblioteca_emprestimo, class: 'Biblioteca::Emprestimo' do
    biblioteca_livro "MyString"
    pessoa nil
    status 1
    data "2018-08-10"
    nota "MyText"
    usuario nil
  end
end
