require 'rails_helper'

RSpec.describe "TipoPessoas", type: :request do
  describe "GET /tipo_pessoas" do
    it "works! (now write some real specs)" do
      get tipo_pessoas_path
      expect(response).to have_http_status(200)
    end
  end
end
