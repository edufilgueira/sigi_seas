require 'rails_helper'

RSpec.describe "Socioeduk::Processos", type: :request do
  sign_in_user
  describe "GET /socioeduk_processos" do
    it "works! (now write some real specs)" do
      get socioeduk_processos_path
      expect(response).to have_http_status(200)
    end
  end
end
