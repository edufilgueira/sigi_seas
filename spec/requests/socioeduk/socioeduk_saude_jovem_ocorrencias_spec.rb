require 'rails_helper'

RSpec.describe "Socioeduk::SaudeJovemOcorrencias", type: :request do
  describe "GET /socioeduk_saude_jovem_ocorrencias" do
    it "works! (now write some real specs)" do
      get socioeduk_saude_jovem_ocorrencias_path
      expect(response).to have_http_status(200)
    end
  end
end
