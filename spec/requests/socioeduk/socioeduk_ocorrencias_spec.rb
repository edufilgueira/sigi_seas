require 'rails_helper'

RSpec.describe "Socioeduk::Ocorrencias", type: :request do
  sign_in_user
  describe "GET /socioeduk_ocorrencias" do
    it "works! (now write some real specs)" do
      get socioeduk_ocorrencias_path
      expect(response).to have_http_status(200)
    end
  end
end
