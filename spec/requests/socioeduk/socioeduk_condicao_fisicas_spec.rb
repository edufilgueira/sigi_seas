require 'rails_helper'

RSpec.describe "Socioeduk::CondicaoFisicas", type: :request do
  sign_in_user
  describe "GET /socioeduk_condicao_fisicas" do
    it "works! (now write some real specs)" do
      get socioeduk_condicao_fisicas_path
      expect(response).to have_http_status(200)
    end
  end
end
