class Biblioteca::Autor < ApplicationRecord

  def to_s
    self.nome
  end

end
