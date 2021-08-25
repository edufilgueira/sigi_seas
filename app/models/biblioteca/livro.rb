class Biblioteca::Livro < ApplicationRecord
  belongs_to :biblioteca_autor, class_name: 'Biblioteca::Autor', foreign_key: 'biblioteca_autor_id'
  belongs_to :biblioteca_local, class_name: 'Biblioteca::Local', foreign_key: 'biblioteca_local_id'
  has_many :biblioteca_emprestimos
  
  def to_s
    titulo
  end

end
