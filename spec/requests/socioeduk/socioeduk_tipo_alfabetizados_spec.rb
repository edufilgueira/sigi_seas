require 'rails_helper'

RSpec.describe "Socioeduk::TipoAlfabetizados", type: :request do
  sign_in_user
  describe "GET /socioeduk_tipo_alfabetizados" do
    it "works! (now write some real specs)" do
      get socioeduk_tipo_alfabetizados_path
      expect(response).to have_http_status(200)
    end
  end
end
