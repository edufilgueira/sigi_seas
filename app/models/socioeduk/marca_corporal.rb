# frozen_string_literal: true

class Socioeduk::MarcaCorporal < ApplicationRecord
  belongs_to :socioeduk_jovem
  belongs_to :marca_corporal
end
