class Socioeduk::Quarto < ApplicationRecord
  belongs_to :socioeduk_bloco, class_name: 'Socioeduk::Bloco', required: false
end
