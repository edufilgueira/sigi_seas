require "rails_helper"

RSpec.describe Socioeduk::PedagogicoJovemDisciplinaEscolaridadesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/pedagogico_jovem_disciplina_escolaridades").to route_to("socioeduk/pedagogico_jovem_disciplina_escolaridades#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/pedagogico_jovem_disciplina_escolaridades/new").to route_to("socioeduk/pedagogico_jovem_disciplina_escolaridades#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/pedagogico_jovem_disciplina_escolaridades/1").to route_to("socioeduk/pedagogico_jovem_disciplina_escolaridades#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/pedagogico_jovem_disciplina_escolaridades/1/edit").to route_to("socioeduk/pedagogico_jovem_disciplina_escolaridades#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/pedagogico_jovem_disciplina_escolaridades").to route_to("socioeduk/pedagogico_jovem_disciplina_escolaridades#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/pedagogico_jovem_disciplina_escolaridades/1").to route_to("socioeduk/pedagogico_jovem_disciplina_escolaridades#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/pedagogico_jovem_disciplina_escolaridades/1").to route_to("socioeduk/pedagogico_jovem_disciplina_escolaridades#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/pedagogico_jovem_disciplina_escolaridades/1").to route_to("socioeduk/pedagogico_jovem_disciplina_escolaridades#destroy", :id => "1")
    end
  end
end
