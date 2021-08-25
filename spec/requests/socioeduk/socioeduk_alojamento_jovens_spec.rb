require 'rails_helper'

RSpec.describe "Socioeduk::AlojamentoJovens", type: :request do
  sign_in_user
  describe "GET /socioeduk_alojamento_jovens" do
    it "works! (now write some real specs)" do
      get socioeduk_alojamento_jovens_path
      expect(response).to have_http_status(200)
    end
  end
end
