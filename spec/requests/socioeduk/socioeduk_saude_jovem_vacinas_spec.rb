require 'rails_helper'

RSpec.describe "Socioeduk::SaudeJovemVacinas", type: :request do
  sign_in_user
  describe "GET /socioeduk_saude_jovem_vacinas" do
    it "works! (now write some real specs)" do
      get socioeduk_saude_jovem_vacinas_path
      expect(response).to have_http_status(200)
    end
  end
end
