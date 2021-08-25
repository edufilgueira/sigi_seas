require 'rails_helper'

RSpec.describe "SolicitacaoPatrimonios", type: :request do
  describe "GET /solicitacao_patrimonios" do
    it "works! (now write some real specs)" do
      get solicitacao_patrimonios_path
      expect(response).to have_http_status(200)
    end
  end
end
