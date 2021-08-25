require "rails_helper"

RSpec.describe Socioeduk::PedagogicoJovemDisciplinaEscolaridadeMedidasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/pedagogico_jovem_disciplina_escolaridade_medidas").to route_to("socioeduk/pedagogico_jovem_disciplina_escolaridade_medidas#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/pedagogico_jovem_disciplina_escolaridade_medidas/new").to route_to("socioeduk/pedagogico_jovem_disciplina_escolaridade_medidas#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/pedagogico_jovem_disciplina_escolaridade_medidas/1").to route_to("socioeduk/pedagogico_jovem_disciplina_escolaridade_medidas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/pedagogico_jovem_disciplina_escolaridade_medidas/1/edit").to route_to("socioeduk/pedagogico_jovem_disciplina_escolaridade_medidas#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/pedagogico_jovem_disciplina_escolaridade_medidas").to route_to("socioeduk/pedagogico_jovem_disciplina_escolaridade_medidas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/pedagogico_jovem_disciplina_escolaridade_medidas/1").to route_to("socioeduk/pedagogico_jovem_disciplina_escolaridade_medidas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/pedagogico_jovem_disciplina_escolaridade_medidas/1").to route_to("socioeduk/pedagogico_jovem_disciplina_escolaridade_medidas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/pedagogico_jovem_disciplina_escolaridade_medidas/1").to route_to("socioeduk/pedagogico_jovem_disciplina_escolaridade_medidas#destroy", :id => "1")
    end
  end
end
