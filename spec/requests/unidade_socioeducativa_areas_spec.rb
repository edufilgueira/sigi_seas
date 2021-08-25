require 'rails_helper'

RSpec.describe "UnidadeSocioeducativaAreas", type: :request do
  describe "GET /unidade_socioeducativa_areas" do
    it "works! (now write some real specs)" do
      get unidade_socioeducativa_areas_path
      expect(response).to have_http_status(200)
    end
  end
end
