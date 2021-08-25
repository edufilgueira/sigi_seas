require 'rails_helper'

RSpec.describe "Socioeduk::TipoParentescos", type: :request do
  sign_in_user
  describe "GET /socioeduk_tipo_parentescos" do
    it "works! (now write some real specs)" do
      get socioeduk_tipo_parentescos_path
      expect(response).to have_http_status(200)
    end
  end
end
