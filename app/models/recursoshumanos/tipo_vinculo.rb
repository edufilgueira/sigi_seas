# frozen_string_literal: true

class Recursoshumanos::TipoVinculo < ApplicationRecord
  audited
  
  validates_presence_of :nome

  has_many :contratos

  def to_s
    nome
  end
end
