require 'rails_helper'

RSpec.describe "Biblioteca::Editoras", type: :request do
  sign_in_user
  describe "GET /biblioteca_editoras" do
    it "works! (now write some real specs)" do
      get biblioteca_editoras_path
      expect(response).to have_http_status(200)
    end
  end
end
