# -*- coding: utf-8 -*-

# frozen_string_literal: true

class Pessoa < ApplicationRecord
  audited
  acts_as_paranoid
  validates_presence_of :nome
  validates_presence_of :cpf
  validates :cpf, uniqueness: true
  #validates_presence_of :sexo
  #validates_presence_of :data_contratacao

  belongs_to :usuario, required: false
  belongs_to :tipo_pessoa
  belongs_to :cidade
  has_many :solicitacao_transportes

  # Essas associações são referentes ao papel de cada pessoa
  # Por definição gerencial os que antes se definiam Funções passaram a ser chamadas de Papeis
  # enquanto os Cargos é que são referidos na interface como Função.
  has_many :funcao_pessoa
  has_many :funcoes, through: :funcao_pessoa

  # Esse vinculo servirá de ligação ao cargo , definido na interface como Função.
  # Se você procura o cargo(ou função como dito na interface) da pessoa é esse metodo que busca.
  has_one :recursoshumanos_vinculo, class_name: 'Recursoshumanos::Vinculo', foreign_key: :pessoas_id

  def self.sem_cargo
    joins('LEFT JOIN recursoshumanos_vinculos vinculos ON vinculos.pessoas_id = pessoas.id')
    .where('pessoas.id not in (SELECT pessoas.id FROM pessoas WHERE vinculos.pessoas_id=pessoas.id)')
    .order('nome')
  end

  def self.estado_civil
    ['Solteiro', 'Casado', 'Viuvo', 'Divorciado', 'União Estável']
  end

  def self.tipo_sanguineo
    ["O-", "O+", "A-", "A+", "B-", "B+", "AB-", "AB+"]
  end

  def self.opcoes_sexo
    { Masculino: :M , Feminino: :F}
  end

  def self.estados
    {'CE'=>'CE',
     'AC'=>'AC',
     'AL'=>'AL',
     'AP'=>'AP',
     'AM'=>'AM',
     'BA'=>'BA',
     'DF'=>'DF',
     'ES'=>'ES',
     'GO'=>'GO',
     'MA'=>'MA',
     'MT'=>'MT',
     'MS'=>'MS',
     'MG'=>'MG',
     'PA'=>'PA',
     'PB'=>'PB',
     'PR'=>'PR',
     'PE'=>'PE',
     'PI'=>'PI',
     'RJ'=>'RJ',
     'RN'=>'RN',
     'RS'=>'RS',
     'RO'=>'RO',
     'RR'=>'RR',
     'SC'=>'SC',
     'SP'=>'SP',
     'SE'=>'SE',
     'TO'=>'TO'}
     end

  def to_s
    nome&.upcase
  end

  def possui_funcao?(nome)
    funcoes.where(nome: nome).any?
  end

  def self.funcao_pessoa
    joins(recursoshumanos_vinculo: :recursoshumanos_cargo).where('recursoshumanos_vinculos.pessoas_id = pessoas.id').select('recursoshumanos_cargos.nome').last
  end
end
