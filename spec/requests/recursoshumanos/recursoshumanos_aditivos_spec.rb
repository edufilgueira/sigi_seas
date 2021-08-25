require 'rails_helper'

RSpec.describe "Recursoshumanos::Aditivos", type: :request do
  sign_in_user
  describe "GET /recursoshumanos_aditivos" do
    it "works! (now write some real specs)" do
      get recursoshumanos_aditivos_path
      expect(response).to have_http_status(200)
    end
  end
end
