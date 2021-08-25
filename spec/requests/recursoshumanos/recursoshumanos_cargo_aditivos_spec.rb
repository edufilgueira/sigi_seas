require 'rails_helper'

RSpec.describe "Recursoshumanos::CargoAditivos", type: :request do
  sign_in_user
  describe "GET /recursoshumanos_cargo_aditivos" do
    it "works! (now write some real specs)" do
      get recursoshumanos_cargo_aditivos_path
      expect(response).to have_http_status(200)
    end
  end
end
