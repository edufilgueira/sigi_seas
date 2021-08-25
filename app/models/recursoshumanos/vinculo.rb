# frozen_string_literal: true

# Modulo que define toda a estrutura de recursoshumanos.
module Recursoshumanos
  # * Classe Recursoshumanos::Vinculo define um Vinculo entre um Cargo e uma
  #   Pessoa. Este Vinculo existira um para cada novo Cargo que uma Pessoa
  #   atingir, tornando o antigo com o status de encerrado.
  # * Uma Pessoa so' podera' ter um vinculo ativo.
  class Vinculo < ApplicationRecord
    audited
    
    belongs_to :recursoshumanos_cargo, class_name: 'Recursoshumanos::Cargo'
    belongs_to :pessoas, class_name: 'Pessoa'
    belongs_to :unidade_socioeducativa_area

    delegate :recursoshumanos_tipo_legal, to: :recursoshumanos_cargo

  end
end
