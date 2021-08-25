require 'rails_helper'

RSpec.describe "Socioeduk::ConvivioFamiliares", type: :request do
  sign_in_user
  describe "GET /socioeduk_convivio_familiares" do
    it "works! (now write some real specs)" do
      get socioeduk_convivio_familiares_path
      expect(response).to have_http_status(200)
    end
  end
end
