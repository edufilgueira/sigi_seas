require 'rails_helper'

RSpec.describe "UnidadeBlocoDormitorios", type: :request do
  describe "GET /unidade_bloco_dormitorios" do
    it "works! (now write some real specs)" do
      get unidade_bloco_dormitorios_path
      expect(response).to have_http_status(200)
    end
  end
end
