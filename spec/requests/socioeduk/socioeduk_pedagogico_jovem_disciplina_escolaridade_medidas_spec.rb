require 'rails_helper'

RSpec.describe "Socioeduk::PedagogicoJovemDisciplinaEscolaridadeMedidas", type: :request do
  sign_in_user
  describe "GET /socioeduk_pedagogico_jovem_disciplina_escolaridade_medidas" do
    it "works! (now write some real specs)" do
      get socioeduk_pedagogico_jovem_disciplina_escolaridade_medidas_path
      expect(response).to have_http_status(200)
    end
  end
end
