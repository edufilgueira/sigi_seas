class Socioeduk::ArtigoAlinea < ApplicationRecord
  belongs_to :socioeduk_artigo_inciso, class_name: 'Socioeduk::ArtigoInciso'
end
