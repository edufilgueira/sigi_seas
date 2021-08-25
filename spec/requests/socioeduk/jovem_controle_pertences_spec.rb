require 'rails_helper'

RSpec.describe "Socioeduk::JovemControlePertences", type: :request do
  describe "GET /socioeduk/jovem_controle_pertences" do
    it "works! (now write some real specs)" do
      get socioeduk_jovem_controle_pertences_path
      expect(response).to have_http_status(200)
    end
  end
end
