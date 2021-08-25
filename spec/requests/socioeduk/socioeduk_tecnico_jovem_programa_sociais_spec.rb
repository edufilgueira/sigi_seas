require 'rails_helper'

RSpec.describe "Socioeduk::TecnicoJovemProgramaSociais", type: :request do
  sign_in_user
  describe "GET /socioeduk_tecnico_jovem_programa_sociais" do
    it "works! (now write some real specs)" do
      get socioeduk_tecnico_jovem_programa_sociais_path
      expect(response).to have_http_status(200)
    end
  end
end
