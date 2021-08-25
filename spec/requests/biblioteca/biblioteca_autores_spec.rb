require 'rails_helper'

RSpec.describe "Biblioteca::Autores", type: :request do
  sign_in_user
  describe "GET /biblioteca_autores" do
    it "works! (now write some real specs)" do
      get biblioteca_autores_path
      expect(response).to have_http_status(200)
    end
  end
end
