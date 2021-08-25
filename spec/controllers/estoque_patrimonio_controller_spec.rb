# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EstoquePatrimonioController, type: :controller do
  stub_sign_in
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
