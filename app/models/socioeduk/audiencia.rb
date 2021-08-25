class Socioeduk::Audiencia < ApplicationRecord
  belongs_to :socioeduk_processo, class_name: 'Socioeduk::Processo'
  belongs_to :socioeduk_comarca, class_name: 'Socioeduk::Comarca'
end
