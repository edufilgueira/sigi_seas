require 'rails_helper'

RSpec.describe "Socioeduk::MedidaSocioeducativas", type: :request do
  describe "GET /socioeduk_medida_socioeducativas" do
    it "works! (now write some real specs)" do
      get socioeduk_medida_socioeducativas_path
      expect(response).to have_http_status(200)
    end
  end
end
