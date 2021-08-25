require 'rails_helper'

RSpec.describe "Urlbm::AtoInfracionais", type: :request do
  describe "GET /urlbm/ato_infracionais" do
    it "works! (now write some real specs)" do
      get urlbm_ato_infracionais_path
      expect(response).to have_http_status(200)
    end
  end
end
