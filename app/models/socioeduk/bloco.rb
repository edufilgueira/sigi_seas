class Socioeduk::Bloco < ApplicationRecord
  belongs_to :unidade_socioeducativa
  has_many :quartos
end
