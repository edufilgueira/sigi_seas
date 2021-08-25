require 'rails_helper'

RSpec.describe "Socioeduk::Audiencias", type: :request do
  describe "GET /socioeduk_audiencias" do
    it "works! (now write some real specs)" do
      get socioeduk_audiencias_path
      expect(response).to have_http_status(200)
    end
  end
end
