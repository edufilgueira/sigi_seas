require 'rails_helper'

RSpec.describe "Socioeduk::RelatorioDiarios", type: :request do
  describe "GET /socioeduk_relatorio_diarios" do
    it "works! (now write some real specs)" do
      get socioeduk_relatorio_diarios_path
      expect(response).to have_http_status(200)
    end
  end
end
