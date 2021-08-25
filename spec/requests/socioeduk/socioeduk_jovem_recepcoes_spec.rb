require 'rails_helper'

RSpec.describe "Socioeduk::JovemRecepcoes", type: :request do
  describe "GET /socioeduk_jovem_recepcoes" do
    it "works! (now write some real specs)" do
      get socioeduk_jovem_recepcoes_path
      expect(response).to have_http_status(200)
    end
  end
end
