require 'rails_helper'

RSpec.describe "Urlbm::StatusMaps", type: :request do
  describe "GET /urlbm/status_maps" do
    it "works! (now write some real specs)" do
      get urlbm_status_maps_path
      expect(response).to have_http_status(200)
    end
  end
end
