require 'rails_helper'

RSpec.describe "Socioeduk::LocalAtendimentos", type: :request do
  sign_in_user
  describe "GET /socioeduk_local_atendimentos" do
    it "works! (now write some real specs)" do
      get socioeduk_local_atendimentos_path
      expect(response).to have_http_status(200)
    end
  end
end
