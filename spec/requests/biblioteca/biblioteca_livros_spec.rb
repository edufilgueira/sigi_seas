require 'rails_helper'

RSpec.describe "Biblioteca::Livros", type: :request do
  sign_in_user
  describe "GET /biblioteca_livros" do
    it "works! (now write some real specs)" do
      get biblioteca_livros_path
      expect(response).to have_http_status(200)
    end
  end
end
