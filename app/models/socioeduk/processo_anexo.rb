class Socioeduk::ProcessoAnexo < ApplicationRecord
  belongs_to :socioeduk_processo, class_name: 'Socioeduk::Processo'
  
  has_attached_file :anexo
  validates_attachment_content_type :anexo, :content_type => [/\Aimage\/.*\Z/, /\Avideo\/.*\Z/, /\Aaudio\/.*\Z/, /\Aapplication\/.*\Z/]
end
