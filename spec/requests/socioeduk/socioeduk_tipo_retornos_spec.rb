require 'rails_helper'

RSpec.describe "Socioeduk::TipoRetornos", type: :request do
  sign_in_user
  describe "GET /socioeduk_tipo_retornos" do
    it "works! (now write some real specs)" do
      get socioeduk_tipo_retornos_path
      expect(response).to have_http_status(200)
    end
  end
end
