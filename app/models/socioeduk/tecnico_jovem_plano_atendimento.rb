class Socioeduk::TecnicoJovemPlanoAtendimento < ApplicationRecord
  belongs_to :tecnico_jovem, class_name: 'Socioeduk::TecnicoJovem'

  has_attached_file :anexo
  validates_attachment_content_type :anexo, :content_type => [/\Aimage\/.*\Z/, /\Avideo\/.*\Z/, /\Aaudio\/.*\Z/, /\Aapplication\/.*\Z/]
end
