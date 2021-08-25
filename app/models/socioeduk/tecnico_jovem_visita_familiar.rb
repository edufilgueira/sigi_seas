class Socioeduk::TecnicoJovemVisitaFamiliar < ApplicationRecord
  belongs_to :tecnico_jovem, class_name: 'Socioeduk::TecnicoJovem'
end
