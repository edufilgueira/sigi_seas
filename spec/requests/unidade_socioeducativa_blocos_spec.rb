require 'rails_helper'

RSpec.describe "UnidadeSocioeducativaBlocos", type: :request do
  describe "GET /unidade_socioeducativa_blocos" do
    it "works! (now write some real specs)" do
      get unidade_socioeducativa_blocos_path
      expect(response).to have_http_status(200)
    end
  end
end
