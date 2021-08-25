class Biblioteca::Local < ApplicationRecord
  
  def to_s
    self.nome
  end

end
