class Socioeduk::AlojamentoJovem < ApplicationRecord
  belongs_to :socioeduk_jovem, class_name: 'Socioeduk::Jovem'
  belongs_to :unidade_socioeducativa
  belongs_to :socioeduk_bloco, class_name: 'Socioeduk::Bloco'
  belongs_to :socioeduk_quarto, class_name: 'Socioeduk::Quarto'
end
