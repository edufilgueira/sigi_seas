require "rails_helper"

RSpec.describe Socioeduk::TecnicoJovemFamiliasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/tecnico_jovem_familias").to route_to("socioeduk/tecnico_jovem_familias#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/tecnico_jovem_familias/new").to route_to("socioeduk/tecnico_jovem_familias#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/tecnico_jovem_familias/1").to route_to("socioeduk/tecnico_jovem_familias#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/tecnico_jovem_familias/1/edit").to route_to("socioeduk/tecnico_jovem_familias#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/tecnico_jovem_familias").to route_to("socioeduk/tecnico_jovem_familias#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/tecnico_jovem_familias/1").to route_to("socioeduk/tecnico_jovem_familias#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/tecnico_jovem_familias/1").to route_to("socioeduk/tecnico_jovem_familias#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/tecnico_jovem_familias/1").to route_to("socioeduk/tecnico_jovem_familias#destroy", :id => "1")
    end
  end
end
