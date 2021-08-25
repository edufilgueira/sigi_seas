require "rails_helper"

RSpec.describe Socioeduk::TecnicoJovemVisitaFamiliaresController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/tecnico_jovem_visita_familiares").to route_to("socioeduk/tecnico_jovem_visita_familiares#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/tecnico_jovem_visita_familiares/new").to route_to("socioeduk/tecnico_jovem_visita_familiares#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/tecnico_jovem_visita_familiares/1").to route_to("socioeduk/tecnico_jovem_visita_familiares#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/tecnico_jovem_visita_familiares/1/edit").to route_to("socioeduk/tecnico_jovem_visita_familiares#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/tecnico_jovem_visita_familiares").to route_to("socioeduk/tecnico_jovem_visita_familiares#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/tecnico_jovem_visita_familiares/1").to route_to("socioeduk/tecnico_jovem_visita_familiares#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/tecnico_jovem_visita_familiares/1").to route_to("socioeduk/tecnico_jovem_visita_familiares#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/tecnico_jovem_visita_familiares/1").to route_to("socioeduk/tecnico_jovem_visita_familiares#destroy", :id => "1")
    end
  end
end
