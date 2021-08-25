# frozen_string_literal: true

class Socioeduk::EnderecoJovem < ApplicationRecord
  acts_as_paranoid
  belongs_to :socioeduk_jovem, class_name: 'Socioeduk::Jovem', foreign_key: 'socioeduk_jovem_id', required: false
  belongs_to :cidade, required: false
end
