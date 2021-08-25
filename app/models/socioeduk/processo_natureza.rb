class Socioeduk::ProcessoNatureza < ApplicationRecord
  belongs_to :processo, class_name: 'Socioeduk::Processo'
  belongs_to :socioeduk_artigo_infracao, class_name: 'Socioeduk::ArtigoInfracao'
  belongs_to :socioeduk_numero_processo, class_name: 'Socioeduk::NumeroProcesso'
  belongs_to :socioeduk_artigo_inciso, class_name: 'Socioeduk::ArtigoInciso', required: false
  belongs_to :socioeduk_artigo_alinea, class_name: 'Socioeduk::ArtigoAlinea', required: false
end
