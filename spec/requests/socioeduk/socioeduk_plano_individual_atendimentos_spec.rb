require 'rails_helper'

RSpec.describe "Socioeduk::PlanoIndividualAtendimentos", type: :request do
  sign_in_user
  describe "GET /socioeduk_plano_individual_atendimentos" do
    it "works! (now write some real specs)" do
      get socioeduk_plano_individual_atendimentos_path
      expect(response).to have_http_status(200)
    end
  end
end
