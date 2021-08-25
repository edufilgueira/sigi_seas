class Socioeduk::NumeroProcesso < ApplicationRecord
  belongs_to :socioeduk_processo, class_name: 'Socioeduk::Processo'
  belongs_to :socioeduk_comarca, class_name: 'Socioeduk::Comarca', required: false
  belongs_to :cidade, class_name: 'Cidade', required: false
  has_many :socioeduk_medida_socioeducativas
  validates_presence_of :numero
end
