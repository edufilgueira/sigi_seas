require 'rails_helper'

RSpec.describe "Socioeduk::ArtigoParagrafos", type: :request do
  describe "GET /socioeduk_artigo_paragrafos" do
    it "works! (now write some real specs)" do
      get socioeduk_artigo_paragrafos_path
      expect(response).to have_http_status(200)
    end
  end
end
