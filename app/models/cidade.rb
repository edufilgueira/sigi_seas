class Cidade < ApplicationRecord
  belongs_to :estado
  belongs_to :cidade, class_name: "Cidade", foreign_key: "regiao_pai"
  has_many :socioeduk_endereco_jovens
  has_many :unidades_socioeducativas
  has_many :bairros
end
