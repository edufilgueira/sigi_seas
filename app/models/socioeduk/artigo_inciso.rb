class Socioeduk::ArtigoInciso < ApplicationRecord
  belongs_to :socioeduk_artigo_paragrafo, class_name: 'Socioeduk::ArtigoParagrafo'
end
