class Biblioteca::Emprestimo < ApplicationRecord
  belongs_to :pessoa
  belongs_to :biblioteca_livro, class_name: 'Biblioteca::Livro', required: false
  belongs_to :usuario
end
