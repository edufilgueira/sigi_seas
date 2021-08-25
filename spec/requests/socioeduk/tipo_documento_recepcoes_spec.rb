require 'rails_helper'

RSpec.describe "Socioeduk::TipoDocumentoRecepcoes", type: :request do
  describe "GET /socioeduk/tipo_documento_recepcoes" do
    it "works! (now write some real specs)" do
      get socioeduk_tipo_documento_recepcoes_path
      expect(response).to have_http_status(200)
    end
  end
end
