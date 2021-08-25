require 'rails_helper'

RSpec.describe "Bairros", type: :request do
  describe "GET /bairros" do
    it "works! (now write some real specs)" do
      get bairros_path
      expect(response).to have_http_status(200)
    end
  end
end
