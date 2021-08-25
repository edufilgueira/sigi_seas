class Socioeduk::TecnicoJovemAnexo < ApplicationRecord
  belongs_to :socioeduk_tecnico_jovem, class_name:'Socioeduk::TecnicoJovem'
  belongs_to :unidade_socioeducativa

  has_attached_file :anexo
  validates_attachment_content_type :anexo, :content_type => [/\Aimage\/.*\Z/, /\Avideo\/.*\Z/, /\Aaudio\/.*\Z/, /\Aapplication\/.*\Z/]
end
