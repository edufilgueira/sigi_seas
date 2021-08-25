require 'rails_helper'

RSpec.describe "Socioeduk::SituacaoCumprimentos", type: :request do
  describe "GET /socioeduk_situacao_cumprimentos" do
    it "works! (now write some real specs)" do
      get socioeduk_situacao_cumprimentos_path
      expect(response).to have_http_status(200)
    end
  end
end
