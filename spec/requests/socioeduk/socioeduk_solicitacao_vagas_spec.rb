require 'rails_helper'

RSpec.describe "Socioeduk::SolicitacaoVagas", type: :request do
  describe "GET /socioeduk_solicitacao_vagas" do
    it "works! (now write some real specs)" do
      get socioeduk_solicitacao_vagas_path
      expect(response).to have_http_status(200)
    end
  end
end
