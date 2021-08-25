require 'rails_helper'

RSpec.describe "GestaoDemandas::Solicitacoes", type: :request do
  describe "GET /gestao_demandas/solicitacoes" do
    it "works! (now write some real specs)" do
      get gestao_demandas_solicitacoes_path
      expect(response).to have_http_status(200)
    end
  end
end
