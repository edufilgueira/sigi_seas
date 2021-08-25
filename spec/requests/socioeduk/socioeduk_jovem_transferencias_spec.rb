require 'rails_helper'

RSpec.describe "Socioeduk::JovemTransferencias", type: :request do
  sign_in_user
  describe "GET /socioeduk_jovem_transferencias" do
    it "works! (now write some real specs)" do
      get socioeduk_jovem_transferencias_path
      expect(response).to have_http_status(200)
    end
  end
end