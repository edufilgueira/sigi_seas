require 'rails_helper'

RSpec.describe "Socioeduk::Cids", type: :request do
  sign_in_user
  describe "GET /socioeduk_cids" do
    it "works! (now write some real specs)" do
      get socioeduk_cids_path
      expect(response).to have_http_status(200)
    end
  end
end
