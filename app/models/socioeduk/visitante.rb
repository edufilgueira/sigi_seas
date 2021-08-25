class Socioeduk::Visitante < ApplicationRecord
  belongs_to :socioeduk_jovem, class_name: 'Socioeduk::Jovem'
  belongs_to :socioeduk_tipo_documento, class_name: 'Socioeduk::TipoDocumento'
  
  has_many :socioeduk_visitante_jovens, class_name: 'Socioeduk::VisitanteJovem', :foreign_key => "socioeduk_visitante_id"

  has_attached_file :foto
  has_attached_file :anexo
  validates_attachment_content_type :foto, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment_file_name :anexo, matches: [/\.pdf$/, /\.docx?$/, /\.xlsx?$/, /\.odt$/, /\.ods$/]

  accepts_nested_attributes_for :socioeduk_visitante_jovens, reject_if: :all_blank, allow_destroy: true
end
