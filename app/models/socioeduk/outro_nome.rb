class Socioeduk::OutroNome < ApplicationRecord
  acts_as_paranoid
  belongs_to :socioeduk_jovem, class_name: 'Socioeduk::Jovem', required: false
end
