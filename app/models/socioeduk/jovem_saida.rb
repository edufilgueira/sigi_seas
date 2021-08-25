class Socioeduk::JovemSaida < ApplicationRecord
  belongs_to :socioeduk_jovem, class_name: 'Socioeduk::Jovem'
end
