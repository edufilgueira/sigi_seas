# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Patrimonios', type: :request do
  sign_in_user
  describe 'GET /patrimonios' do
    it 'works! (now write some real specs)' do
      get patrimonios_path
      expect(response).to have_http_status(200)
    end
  end
end
