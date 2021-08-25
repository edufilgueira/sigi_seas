require 'rails_helper'

RSpec.describe "Socioeduk::ProcessoRecepcaoJovemInfracoes", type: :request do
  describe "GET /socioeduk_processo_recepcao_jovem_infracoes" do
    it "works! (now write some real specs)" do
      get socioeduk_processo_recepcao_jovem_infracoes_path
      expect(response).to have_http_status(200)
    end
  end
end
