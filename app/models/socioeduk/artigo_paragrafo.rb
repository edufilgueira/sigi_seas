class Socioeduk::ArtigoParagrafo < ApplicationRecord
  belongs_to :socioeduk_artigo_infracao, class_name: 'Socioeduk::ArtigoInfracao'
end
