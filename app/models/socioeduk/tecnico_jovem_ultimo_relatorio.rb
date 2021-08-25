class Socioeduk::TecnicoJovemUltimoRelatorio < ApplicationRecord
  belongs_to :tecnico_jovem, class_name: 'Socioeduk::TecnicoJovem'
  belongs_to :socioeduk_sugestao_relatorio, class_name: 'Socioeduk::SugestaoRelatorio', required: false
  belongs_to :socioeduk_tipo_retorno, class_name: 'Socioeduk::TipoRetorno', required: false

  has_attached_file :foto
  has_attached_file :anexo
  validates_attachment_content_type :foto, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment_file_name :anexo, matches: [/\.pdf$/, /\.docx?$/, /\.xlsx?$/, /\.odt$/, /\.ods$/]
end
