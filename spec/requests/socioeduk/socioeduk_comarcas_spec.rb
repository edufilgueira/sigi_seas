require 'rails_helper'

RSpec.describe "Socioeduk::Comarcas", type: :request do
  sign_in_user
  describe "GET /socioeduk_comarcas" do
    it "works! (now write some real specs)" do
      get socioeduk_comarcas_path
      expect(response).to have_http_status(200)
    end
  end
end
