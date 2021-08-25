require 'rails_helper'

RSpec.describe "Urlbm::Mapas", type: :request do
  describe "GET /urlbm/mapas" do
    it "works! (now write some real specs)" do
      get urlbm_mapas_path
      expect(response).to have_http_status(200)
    end
  end
end
