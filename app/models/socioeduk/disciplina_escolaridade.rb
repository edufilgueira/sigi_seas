class Socioeduk::DisciplinaEscolaridade < ApplicationRecord
  belongs_to :socioeduk_escolaridade, class_name: 'Socioeduk::Escolaridade'
end
