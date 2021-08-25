require 'rails_helper'

RSpec.describe "Socioeduk::TipoDocumentos", type: :request do
  sign_in_user
  describe "GET /socioeduk_tipo_documentos" do
    it "works! (now write some real specs)" do
      get socioeduk_tipo_documentos_path
      expect(response).to have_http_status(200)
    end
  end
end
