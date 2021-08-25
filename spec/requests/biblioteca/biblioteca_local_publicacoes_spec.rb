require 'rails_helper'

RSpec.describe "Biblioteca::LocalPublicacoes", type: :request do
  sign_in_user
  describe "GET /biblioteca_local_publicacoes" do
    it "works! (now write some real specs)" do
      get biblioteca_local_publicacoes_path
      expect(response).to have_http_status(200)
    end
  end
end
