require 'rails_helper'

RSpec.describe "Socioeduk::JovemSaidas", type: :request do
  sign_in_user
  describe "GET /socioeduk_jovem_saidas" do
    it "works! (now write some real specs)" do
      get socioeduk_jovem_saidas_path
      expect(response).to have_http_status(200)
    end
  end
end
