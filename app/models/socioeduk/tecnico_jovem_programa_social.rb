class Socioeduk::TecnicoJovemProgramaSocial < ApplicationRecord
  belongs_to :tecnico_jovem, class_name: 'Socioeduk::TecnicoJovem'
  belongs_to :socioeduk_programa_social, class_name: 'Socioeduk::ProgramaSocial'
end
