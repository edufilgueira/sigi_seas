require 'rails_helper'

RSpec.describe "Socioeduk::OutroNomes", type: :request do
  sign_in_user
  describe "GET /socioeduk_outro_nomes" do
    it "works! (now write some real specs)" do
      get socioeduk_outro_nomes_path
      expect(response).to have_http_status(200)
    end
  end
end
